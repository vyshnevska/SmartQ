class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_filter :set_current_user
  before_filter :configure_permitted_parameters, :if => :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  end

  def set_current_user
    User.current_user = current_user
  end

  def redirect_not_permitted(msg)
    redirect_to root_path, alert: msg
  end

  def redirect_to_root(msg, type)
    redirect_to root_path, type.to_sym => msg
  end

  private
    def signed_in_root_path(resource)
      case resource.role
      when 'admin'
        admin_root_path
      else
        root_path
      end
    end
end

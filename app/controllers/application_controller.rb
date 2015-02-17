class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_current_user

  def set_current_user
    User.current_user = current_user
  end

  def redirect_not_permitted(msg)
    redirect_to root_path, alert: msg
  end

  def redirect_to_root(msg, type)
    redirect_to root_path, type.to_sym => msg
  end

  #TODO: Rework for ajax
  def admin_action?
    redirect_to root_path unless current_user.try(:admin?)
  end

  protected
    def after_sign_in_path_for(resource)
      signed_in_root_path(resource)
    end

    def after_sign_up_path_for(resource)
      signed_in_root_path(resource)
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

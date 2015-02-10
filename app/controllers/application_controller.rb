class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def redirect_not_permitted(msg)
    redirect_to root_path, alert: msg
  end

  def redirect_to_root(msg, type)
    redirect_to root_path, type.to_sym => msg
  end
end

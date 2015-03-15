class AdminController < ApplicationController
  before_action :admin_action?, :except => [:show]

  def admin_action?
    redirect_to root_path, :alert => I18n.t('controllers.admin.restrict_user') unless current_user.admin?
  end
end

class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_action?

  def admin_action?
    redirect_to root_path, :alert => I18n.t('controllers.categories.restrict_user') unless current_user.admin?
  end
end

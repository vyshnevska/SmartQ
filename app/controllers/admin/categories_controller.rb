class  Admin::CategoriesController < ApplicationController
  before_action :restrict_user_by_role
  before_action :set_categories, only: [:index, :update, :destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :js, only: [:new, :edit, :create, :update]

  def index
  end

  def new
    @category = Category.create
    flash.now[:error] = @category.errors.full_messages.join(',') if @invalid = @category.errors.any?
  end

  def update
    if @category.respond_to?(category_params[:field])
      @valid = @category.update_attributes(category_params[:field] => category_params[:value])
      flash.now[:error] = @category.errors.full_messages.join(',') unless @valid
    else
      flash.now[:error] = I18n.t('models.categories.unknown_column')
    end
  end

  def destroy
    redirect_to admin_categories_path, @category.destroy ? { notice: I18n.t('controllers.categories.destroyed', :category => @category.id) } : { error: I18n.t('controllers.categories.not_destroyed', :category => @category.id) }
  end

  protected
    def restrict_user_by_role
      redirect_to root_path, :alert => I18n.t('controllers.categories.restrict_user') unless current_user.admin?
    end

  private
    def set_categories
      @categories =  Category.all
    end

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:field, :value)
    end
end

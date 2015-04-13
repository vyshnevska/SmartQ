class  Admin::CategoriesController < AdminController
  before_action :set_categories, only: [:index, :update, :destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :js, only: [:new, :edit, :create, :update]

  def index
  end

  def new
    @category = Category.create
    flash.now[:error] = @category.errors.full_messages.join(',') unless @valid = @category.persisted?
  end

  def update
    if @category.update_attributes(category_params[:field] => category_params[:value])
      flash.now[:notice] = I18n.t('controllers.categories.updated', :category => @category.id)
    else
      flash.now[:error] = @category.errors.full_messages.join(',')
    end
  end

  def destroy
    redirect_to admin_categories_path, :notice => I18n.t('controllers.categories.destroyed', :category => @category.id) if @category.destroy
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

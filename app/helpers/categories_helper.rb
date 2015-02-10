module CategoriesHelper
  def build_title(category)
    category.title || I18n.t('general.none')
  end

  def build_description(category)
    category.description || I18n.t('general.none')
  end
end

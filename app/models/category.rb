class Category < ActiveRecord::Base
  include LogHistory
  before_destroy :log_to_history

  has_many :questions
  has_many :quizzes

  scope :blank_categories, -> { where('title IS NULL AND description IS NULL') }
  validates_uniqueness_of :title, :message => I18n.t('models.categories.unique_title'), :if => :title_changed?
  validate :one_blank_category, :on => :create

  def one_blank_category
    errors.add(:base, I18n.t('models.categories.one_blank_category')) if Category.blank_categories.count >= 1
  end
end

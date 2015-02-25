class Question < ActiveRecord::Base
  include LogHistory
  before_destroy :log_to_history

  has_many :answers, :dependent => :destroy
  belongs_to :quizz
  belongs_to :category

  accepts_nested_attributes_for :answers, :allow_destroy => :true

  validates :title, :presence => true
  validates :title, :uniqueness => { :scope => :quizz_id }, if: :title_changed?

  scope :by_category, ->(category_name) { where(:category_id => Category.find_by_title(category_name).id) }


  def any_marked?
    self.answers.any?{|answer| answer.correct?}
  end

  def correct_answer
    self.answers.select{|a| a.correct?}.map(&:id)
  end
end

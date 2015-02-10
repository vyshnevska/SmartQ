class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :quizz
  belongs_to :categories

  accepts_nested_attributes_for :answers, :allow_destroy => :true

  validates :title, :presence => true
  validates :title, :uniqueness => { :scope => :quizz_id }, if: :title_changed?

  def any_marked?
    self.answers.any?{|answer| answer.correct?}
  end
end

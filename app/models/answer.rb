class Answer < ActiveRecord::Base
  belongs_to :question

  validates :title, :presence => true
  validates :title, :uniqueness => { :scope => :question_id }, if: :title_changed?

  def correct?
    true if self.correct
  end
end

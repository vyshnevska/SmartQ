class Answer < ActiveRecord::Base
  include LogHistory

  belongs_to :question

  validates :title, :presence => true
  validates :title, :uniqueness => { :scope => :question_id }, :if => :title_changed?

  def correct?
    true if self.correct
  end

  def mark_incorrect
    self.correct = false
  end
end

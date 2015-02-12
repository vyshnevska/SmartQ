class Answer < ActiveRecord::Base
  include LogHistory
  before_destroy :log_to_history

  belongs_to :question

  validates :title, :presence => true
  validates :title, :uniqueness => { :scope => :question_id }, if: :title_changed?

  def correct?
    true if self.correct
  end
end

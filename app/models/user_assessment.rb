class UserAssessment < ActiveRecord::Base
  enum state: [ :draft, :progress, :finish ]

  belongs_to :user
  belongs_to :quizz
  belongs_to :question, :foreign_key => 'current_question_id'
  serialize :user_answers, Hash
  before_update :update_grades

  def update_grades
    self.grade = self.assess_progress
  end

  def assess_progress
    count = 0
    self.user_answers.each do |question, answer|
      count += 1 if self.quizz.questions.where(:id => question).first.correct_answer.include?(answer.to_i)
    end
    count
  end
end

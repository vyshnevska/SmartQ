class UserAssessment < ActiveRecord::Base
  enum state: [ :draft, :progress, :finish ]

  belongs_to :user
  belongs_to :quizz
  belongs_to :question, :foreign_key => 'current_question_id'
end

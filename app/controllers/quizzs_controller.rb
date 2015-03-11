class QuizzsController < ApplicationController
  before_action :set_quizzes, only: [:index, :update, :save_question]
end

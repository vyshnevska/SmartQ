class QuizzsController < ApplicationController
  before_action :set_quizzes, only: [:index, :update, :save_question]

  # def index
  # end

  # private

  #   def set_quizzes
  #     @quizzes = Quizz.published.includes(:questions).paginate(:page => params[:page], :per_page => 5)
  #   end
end

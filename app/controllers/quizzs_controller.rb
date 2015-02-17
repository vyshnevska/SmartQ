class QuizzsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quizzes, only: [:index, :update, :save_question]

  def index
  end

  private

    def set_quizzes
      @quizzes = Quizz.includes(:questions).order('title ASC').paginate(:page => params[:page], :per_page => 5)
    end
end

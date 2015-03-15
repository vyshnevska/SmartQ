class UserAssessmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_assessment, only: [:show, :edit, :update, :destroy]
  before_action :set_quizzes, only: [:index]
  respond_to :html

  def show
    @view_mode = true
    respond_with(@user_assessment)
  end

  def new
    @user_assessment = UserAssessment.find_or_create_by(:quizz_id => params[:quizz], :user_id => current_user.id, :grade => nil)
    @user_assessment.progress!
    respond_with(@user_assessment)
  end

  def edit
  end

  def update
    @user_assessment.finish!
    @user_assessment.update(:user_answers => user_answers_params.to_h)
    respond_with(@user_assessment)
  end

  def destroy
    @user_assessment.destroy
    respond_with(@user_assessment)
  end

  private
    def set_quizzes
      @quizzes = Quizz.published.includes(:questions).paginate(:page => params[:page], :per_page => 5)
    end

    def set_user_assessment
      @user_assessment = UserAssessment.find(params[:id])
    end

    def user_assessment_params
      params.require(:user_assessment).permit(:user_id, :grade, :quizz, :current_question_id, :state)
    end

    def user_answers_params
      params.require(:user_answers)#.permit(:user_id, :grade, :quizz, :current_question_id, :state)
    end
end

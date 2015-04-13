class UserAssessmentsController < ApplicationController
  before_action :set_user_assessment, only: [:show]
  before_action :set_quizzes, only: [:index, :summary_report]
  respond_to :html


  def summary_report
    @data, @chart_title = build_chart_data
    @report_data = build_report_graph_data
  end

  def show
    @view_mode = true
    respond_with(@user_assessment)
  end

  def new
    @user_assessment = UserAssessment.find_or_create_by(:quizz_id => params[:quizz], :user_id => current_user.id, :grade => nil)
    @user_assessment.progress!
    respond_with(@user_assessment)
  end

  # def edit
  # end

  def update
    @user_assessment.finish!
    @user_assessment.update(:user_answers => user_answers_params.to_h)
    respond_with(@user_assessment)
  end

  private
    def set_quizzes
      @quizzes = Quizz.published.includes(:questions).paginate(:page => params[:page], :per_page => 5)
    end

    def set_user_assessment
      @user_assessment = UserAssessment.find(params[:id])
    end

    def user_answers_params
      params.require(:user_answers)#.permit(:user_id, :grade, :quizz, :current_question_id, :state)
    end

    def build_chart_data
      total_quizzes = Quizz.includes(:questions)
      draft_quizzes = total_quizzes.draft.count
      marked_quizzes = total_quizzes.draft.select{|quizz| quizz.all_marked?}.count
      published_quizzes = total_quizzes.published.count
      ready_quizzes = total_quizzes.select{|quizz| quizz.can_complete?}.count
      data = [
              ['Draft', draft_quizzes],
              ['Marked', marked_quizzes],
              ['Published', published_quizzes],
              ['Can complete', ready_quizzes]
      ]
      return data, I18n.t('views.chart.title', :number => total_quizzes.count)
    end

    def build_report_graph_data
      data = User.all.inject([]){ |arr, user| arr << {name: user.name, data: user.statistic_by_period.values || [0]}; arr }
    end
end

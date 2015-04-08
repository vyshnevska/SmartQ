module Api  
  class UserAssessmentsController < Api::BaseController

    private
      # def set_quizzes
      #   @quizzes = Quizz.published.includes(:questions).paginate(:page => params[:page], :per_page => 5)
      # end

      # def set_user_assessment
      #   @user_assessment = UserAssessment.find(params[:id])
      # end
      def user_assessment_params
        # params.require(:user_answers)
        params.require(:user_assessment).permit(:user_id, :grade, :quizz, :current_question_id, :state)
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:user_id, :grade)
      end


      # def user_assessment_params
      #   params.require(:user_assessment).permit(:user_id, :grade, :quizz, :current_question_id, :state)
      # end

      # def user_answers_params
      #   params.require(:user_answers)#.permit(:user_id, :grade, :quizz, :current_question_id, :state)
      # end
  end
end

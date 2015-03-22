class Admin::QuizzsController < AdminController
  before_action :set_quizz, only: [:show, :edit, :update, :destroy, :add_question, :save_question, :complete]
  before_action :set_quizzes, only: [:index, :update, :save_question]

  respond_to :js, only: [:new, :edit, :create, :update, :add_question]

  def index
  end

  def show
    respond_with(@quizz)
  end

  def new
    @quizz = Quizz.new
  end

  def edit
    flash.now[:notice] = I18n.t('views.quizzes.warning_box.mark_answers') unless @quizz.all_marked?
  end

  def create
    @quizz = Quizz.new(quizz_params)
    @quizz.options['category_level'] = category_params[:options] if category_params
    flash.now[:notice] = I18n.t('controllers.quizzes.created', :quizz => @quizz.id) if @valid = @quizz.save
  end

  def update
    @valid = @quizz.update(quizz_params)

    if question_params[:questions]
      question_params[:questions].each do |question_id, data|
        q =  @quizz.questions.find_or_create_by(:id => question_id)
        q.title = data[:title]
        update_answers(data, q)
        @valid = q.save
      end
    end

    flash.now[:notice] = I18n.t('controllers.quizzes.updated', :quizz => @quizz.id) if @valid
  end

  def complete
    if @valid = @quizz.can_complete? && @quizz.set_to_completed!
      redirect_to_root(I18n.t('controllers.quizzes.completed', :quizz => @quizz.id), :notice)
    else
      redirect_to_root(I18n.t('controllers.quizzes.not_completed', :quizz => @quizz.id), :alert)
    end
  end


  def add_question
    @question = @quizz.questions.build
    @answers = 3.times{ @question.answers.build}
  end

  def save_question
    question =  @quizz.questions.new(quizz_data_params)
    flash.now[:notice] = I18n.t('controllers.quizzes.updated', :quizz => @quizz.id) if @valid = question.save
    render 'update.js.erb'
  end

  def destroy
    redirect_to admin_quizzs_path, notice: @quizz.destroy ? 
      I18n.t('controllers.quizzes.destroyed', :quizz => @quizz.id) : I18n.t('controllers.quizzes.not_destroyed', :quizz => @quizz.id)
  end

  private

    def set_quizzes
      @quizzes = Quizz.includes(:questions).order('title ASC').paginate(:page => params[:page], :per_page => 5)
    end

    def set_quizz
      @quizz = Quizz.includes(:questions => [:answers]).find(params[:id])
    end

    def update_answers(data, question)
      if data[:answers_attributes]
        data[:answers_attributes].each do |answer_id, data|
          a =  question.answers.find_or_create_by(:id => answer_id)
          data[:correct] = "false" unless data.include?("correct")
          a.update(data)
        end
      end
    end

    def create_answers(data, question)
      data[:answers].each do |answer|
        a =  question.answers.build(answer)
      end
    end

    def quizz_params
      params.require(:quizz).permit(:title, :category_id)
    end

    def category_params
      params[:category] ? params.require(:category).permit(:options) : nil
    end

    def question_params
      params.require(:quizz).permit(:title, :category_id, :questions => [ :id, :title, :answers_attributes => [:id, :title, :correct]])
    end

    def quizz_data_params
      params.require(:question).permit(:title, :category_id, :answers_attributes => [:id, :title, :correct])
    end
end

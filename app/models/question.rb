class Question < ActiveRecord::Base
  include LogHistory

  has_many :answers, :dependent => :destroy
  belongs_to :quizz
  belongs_to :category

  accepts_nested_attributes_for :answers, :allow_destroy => :true

  validates :title, :presence => true
  validates :title, :uniqueness => { :scope => :quizz_id }, if: :title_changed?

  scope :by_category, ->(category_name) { where(:category_id => Category.find_by_title(category_name).id) }


  def any_marked?
    self.answers.any?{|answer| answer.correct?}
  end

  def correct_answer
    self.answers.select{|a| a.correct?}.map(&:id)
  end

  def update_data(data = {})
    self.title = data[:title]
    update_answers(data)
    self.save
  end

  def update_answers(data)
    if data[:answers_attributes]
      data[:answers_attributes].each do |answer_id, data|
        a =  self.answers.find_or_create_by(:id => answer_id)
        data[:correct] = "false" unless data.include?("correct")
        a.update(data)
      end
    end
  end
end

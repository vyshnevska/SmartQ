class Quizz < ActiveRecord::Base
  include AASM
  include LogHistory

  before_destroy :log_to_history

  has_many :questions, :dependent => :destroy
  has_many :user_assessments

  belongs_to :category
  serialize :options, Hash
  accepts_nested_attributes_for :questions, :allow_destroy => :true

  validates :title, :presence => true
  validates :title, :uniqueness => true, if: :title_changed?

  aasm column: :state do
    state :draft
    state :published
    initial_state :draft
  end

  aasm_event :set_to_completed do
    transitions from: :draft, to: :published
  end

  default_scope { order('title ASC') }

  def all_marked?
    self.questions.all?{|question| question.any_marked?}
  end

  def has_questions?
    self.questions.any?
  end

  def questions_count
    self.questions.try(:count)
  end

  def can_edit?
    self.draft?
  end

  def can_complete?
    can_edit? && has_questions?
  end

  def category_blocks
    case self.options['category_level']
    when 'multiple'
      self.questions.map{|q| q.category.title}.uniq.sort!
    when 'one'
      [self.category.title]
    else
      []
    end
  end
end

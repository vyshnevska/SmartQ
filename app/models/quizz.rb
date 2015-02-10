class Quizz < ActiveRecord::Base
  include AASM
  has_many :questions
  belongs_to :categories
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

  # scope :draft,      where( status: 'draft'     )
  # scope :published,  where( status: 'published' )
  # scope :alphabetically, order("description ASC")
  # scope :by_state, order("status, updated_at ASC")

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
end

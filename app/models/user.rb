class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :user_assessments

  serialize :location, Hash
  geocoded_by :location
  after_validation :geocode

  def set_default_role
    self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true, :uniqueness => true

  START_PERIOD  = Date.new(2015, 1).to_s
  END_PERIOD    = Date.new(2015, 5).to_s

  class << self
    def current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end
  end

  # TODO: extend permission by sections
  def has_permission?(section)
    false
  end

  def statistic_by_period
    result = quizzes_by_monthes_count
    MonthRange.new(START_PERIOD..END_PERIOD).each_month do |month|
      result.merge!(month => 0) unless result.keys.include?(month)
    end

    Rails.env.development? ? result.sort_by{|user,count| user}.to_h : result.to_h
  end

  def quizzes_by_monthes_count
    if Rails.env.production?
      self.user_assessments.group("date_trunc('month', created_at)").count
    else
      self.user_assessments.order('created_at').group('MONTH(created_at)').count
    end
  end

  def count_category
    self.user_assessments.map{|ua| ua.quizz.try(:category_id)}.uniq.count
  end

  def count_quizzes
    self.user_assessments.map{|ua| ua.quizz}.uniq.count
  end

  def count_attempts
    self.user_assessments.map{|ua| ua.quizz}.count
  end

  def summary_by_quizz
    (100 * count_quizzes / Quizz.published.count.to_f).round()
  end

  def summary_by_category
    (100 * count_category / Category.filled.count.to_f).round()
  end
end

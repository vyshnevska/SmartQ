require 'rails_helper'

RSpec.describe Question, :type => :model do
  it { expect have_many :answers }
  it { expect belong_to :quizz }
  it { expect belong_to :categories }
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }

  it 'has a valid factory' do
    expect(build(:question)).to be_valid
  end

  it 'is invalid without a title' do
    expect(build(:question, :title => nil)).to_not be_valid
  end
end

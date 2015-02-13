require 'rails_helper'

RSpec.describe Answer, :type => :model do
  it { expect belong_to :question }
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }

  it 'has a valid factory' do
    expect(build(:answer)).to be_valid
  end

  it 'is invalid without a title' do
    expect(build(:answer, :title => nil)).to_not be_valid
  end
end

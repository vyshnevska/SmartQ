require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:category) { FactoryGirl.create(:category) }

  it { expect have_many :questions }
  it { expect have_many :quizzes }

  it 'has a valid factory' do
    expect(category).to be_valid
  end

  context 'validate uniqueness of title' do
    subject(:category2) { Category.new(:title => category.title) }
    before { category2.valid? }

    it { should have(1).error_on(:title) }
    it { category2.errors[:title].should eq([I18n.t('models.categories.unique_title')]) }
  end
end

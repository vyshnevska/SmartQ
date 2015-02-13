require 'rails_helper'

RSpec.describe Quizz, :type => :model do
  it { expect have_many :questions }
  it { expect belong_to :categories }
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }

  it 'has a valid factory' do
    expect(build(:quizz)).to be_valid
  end

  it 'is invalid without a title' do
    expect(build(:quizz, :title => nil)).to_not be_valid
  end

  describe 'draft quizz' do
    let(:quizz) { FactoryGirl.create(:quizz) }

    it 'has draft state by default' do
      expect(quizz.state).to eq('draft')
    end

    it 'should be available for edit' do
      expect(quizz.can_edit?).to eq(true)
    end

    it 'should not be available for complete' do
      expect(quizz.can_complete?).to eq(false)
    end

    describe '#set_to_completed' do
      subject { quizz.set_to_completed }
      before(:each) { subject }

      it 'has to change state' do
        expect(quizz.state).to eq('published')
      end

      it 'should not be available for edit' do
        expect(quizz.can_edit?).to eq(false)
      end

      it 'should not be available for complete' do
        expect(quizz.can_complete?).to eq(false)
      end
    end

    context 'when have questionnaires' do
      let(:quizz1) { FactoryGirl.create(:quizz_with_qsts) }

      it 'has questions' do
        expect(quizz1.has_questions?).to eq(true)
      end

      it 'has 3 questions' do
        expect(quizz1.questions_count).to eq(3)
      end

      it 'should be available for complete' do
        expect(quizz1.can_complete?).to eq(true)
      end
    end
  end
end

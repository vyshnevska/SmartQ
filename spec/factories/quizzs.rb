require 'ffaker'
FactoryGirl.define do
  factory :quizz do
    title       { Faker::Lorem.word }
    state       'draft'
    category_id 1

    # trait :draft do
    #   title       { Faker::Lorem.word }
    #   state       'draft'
    #   category_id 1
    # end
    # trait :published do
    #   title       { Faker::Lorem.word }
    #   state       'published'
    #   category_id 1
    # end
  end

  factory :quizz_with_qsts, :parent => :quizz do
    after(:create) do |quizz|
      3.times do
        quizz.questions << FactoryGirl.create(:question_with_anws)
      end
    end
  end
end

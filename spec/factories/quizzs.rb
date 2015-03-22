require 'ffaker'
FactoryGirl.define do
  factory :quizz do
    title       { Faker::Lorem.words(3).join(" ") }
    state       'draft'
    category_id 1
  end

  factory :quizz_with_qsts, :parent => :quizz do
    after(:create) do |quizz|
      3.times do
        quizz.questions << FactoryGirl.create(:question_with_anws, quizz: quizz)
      end
    end
  end
end

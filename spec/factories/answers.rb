FactoryGirl.define do
  factory :answer do
    title       { Faker::Lorem.sentence }
    association :question
    correct false
  end

end

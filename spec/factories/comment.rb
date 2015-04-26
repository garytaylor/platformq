FactoryGirl.define do
  factory :comment do
    body Faker::Lorem.words 15
    posted_on {Date.parse('1 January 2015')}
    association :owner, factory: :user

  end
end
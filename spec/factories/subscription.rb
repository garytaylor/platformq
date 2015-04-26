FactoryGirl.define do
  factory :subscription do
    email {Faker::Internet.email}
    name {Faker::Name.name}
  end

end
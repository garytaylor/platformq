FactoryGirl.define do
  factory :article do
    association :owner, :factory => :user
    url_slug {Faker::Internet.slug}
    title {Faker::Lorem.words(3)}
    posted_on {Date.parse('1 January 2015')}
    body {Faker::Lorem.words(10)}
    body_content_type 'text/x-markdown'
  end
end
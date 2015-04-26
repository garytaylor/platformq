# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
main_user = User.where(email: 'test@test.com').first_or_create! email: 'test@test.com', name: 'Test User', password: 'dummypassword', password_confirmation: 'dummypassword'
Article.destroy_all
5.times do |num|
  Article.create title: "Article #{num + 1} title", owner_id: main_user.id, url_slug: "article_#{num + 1}", posted_on: Time.now, body: "# This is a h1 in the body for article #{num + 1}", body_content_type: 'text/x-markdown'

end

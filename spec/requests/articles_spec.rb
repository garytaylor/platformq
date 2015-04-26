require 'rails_helper'
describe 'Articles API', :type => :request do
  context 'With 5 articles present' do
    before :each do
      5.times do
        FactoryGirl.create :article, comment_count: 3
      end
    end
    describe 'GET /articles' do
      #Here, we do quite an in depth test - first of all, the data is setup with 5 articles, each one having 3 comments
      # the response is validated against the article schema which validates its structure.
      # then, we validate key elements of the data to make sure that there are 5 items, with each item having 3 comments
      it 'Should return 5 articles' do
        get '/articles.json'
        expect(response).to be_valid_json_for_schema('articles')
        expect(response_json[:items].length).to eql 5
        expect(response_json[:items]).to all(satisfy {|item| item[:comments].length === 3})
        expect(response_json[:total]).to eql 5
      end
    end
    describe 'POST /articles' do
      it 'Should add 1 to the articles list' do
        post '/articles.json', {url_slug: "sdfsdfdsf",title:"sdfdsfsd", body:"dsfdsfsd"}
        expect(response).to be_valid_json_for_schema('article')
      end
    end

  end
  context 'With 5 subscribers' do
    before :each do
      FactoryGirl.create :user
      5.times do
        FactoryGirl.create :subscription
      end
    end
    describe 'POST /articles with subscribers' do
      it 'Should send 5 emails in the background' do
        perform_enqueued_jobs do
          post '/articles.json', {url_slug: "slug",title:"A new article title", body:"# A new article body"}
          expect(response).to be_valid_json_for_schema('article')
        end
        expect(ActionMailer::Base.deliveries.count).to eql 5


      end
    end
  end
end
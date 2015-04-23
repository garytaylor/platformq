require 'rails_helper'
describe 'Articles API', :type => :request do
  context 'With 5 articles present' do
    before :each do
      5.times do
        FactoryGirl.build :article
      end
    end
    describe 'GET /articles' do
      it 'Should return 5 articles' do
        get '/articles.json'
        expect(response).to be_valid_json_for_schema('articles')
        expect(response_json.items).to have(5).items
        expect(response_json.total).to eql 5
      end
    end

  end
end
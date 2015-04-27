require 'rails_helper'
describe 'Article comments API', :type => :request do
  context 'With 5 articles present each with 3 comments' do
    before :each do
      5.times do
        FactoryGirl.create :article, comment_count: 3
      end
    end
    describe 'POST /articles/:article_id/comments' do
      it 'Should increase the number of comments by 1' do
        expect {
          post "/articles/#{Article.last.id}/comments.json", body: 'This is a comment'
        }.to change(Comment, :count).by(1)
        expect(response).to be_valid_json_for_schema 'comment'
        expect(response_json[:author]).to eql current_user.name
        expect(response_json[:body]).to eql 'This is a comment'
        expect(response_json[:article_id]).to eql Article.last.id
      end
    end

  end


end

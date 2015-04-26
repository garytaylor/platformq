require 'rails_helper'
describe 'Subscriptions API', :type => :request do
  describe 'POST /subscritpions' do
    it 'Should create a subscription' do
      expect {
        post '/subscriptions.json', {name: 'First Last', email: 'firstlast@email.com'}
        expect(response).to be_valid_json_for_schema('subscription')
      }.to change(Subscription, :count).by(1)
    end
  end
end

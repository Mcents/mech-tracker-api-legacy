require 'rails_helper'

RSpec.describe 'Users Api', tpye: :request do
  describe 'POST users' do
    it 'creates a user' do

      params = {
        username: 'mikec',
        password: 'tester123',
        email: 'test2@test.com'
      }

      post '/signup', params: params

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq({"message"=>"Account Created"})
    end
  end
end

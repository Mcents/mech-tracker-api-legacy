require 'rails_helper'

RSpec.describe 'Users Api', tpye: :request do
  describe 'POST users' do
    it 'creates a user' do

      params = {
        username: 'mikec',
        password: 'tester123',
        email: 'test2@test.com'
      }

      post users_path, params: params

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq({"message"=>"Account Created"})
    end

    it 'fails to create a user' do
      params = {
        username: 'mikec',
        password: 'tester123',
      }

      post users_path, params: params

      expect(response.status).to eq(422)
      expect(JSON.parse(response.body)).to eq({"message"=>"Account Not Created"})
    end
  end

  describe 'PUT users' do
    it 'updates a user' do
      user = create(:user)

      params = {
        username: 'mikec',
        email: 'test2@test.com'
      }

      put "/users/#{user.id}", params: params

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq({"message"=>"Account Updated"})
    end
  end
end

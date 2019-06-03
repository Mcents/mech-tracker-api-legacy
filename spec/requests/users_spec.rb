require 'rails_helper'

RSpec.describe 'Users Api', tpye: :request do
  describe 'POST users' do
    it 'creates a user' do

      params = {
        username: 'mikecd',
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

  describe 'POST users login' do
    it 'logs a user in' do
      user = create(:user, password: '123')

      params = {
        email: user.email,
        password: user.password
      }

      post "/users/login",  params: params

      expect(response.status).to eq(200)
    end
  end
end

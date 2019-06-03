# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Terms Api', tpye: :request do
  describe 'POST terms ' do
    it 'creates a term' do
      user = create(:user, username: 'mikec', email: 'mike@test.com', password: '123')
      allow_any_instance_of(ApplicationController).to receive(:payload).and_return(:true)
      allow_any_instance_of(ApplicationController).to receive(:valid_token).and_return(true)

      params = {
        category: 'buying_terms',
        keyword: 'gmk'
      }

      post '/terms', params: params

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq('message' => 'Account Created')
    end

    xit 'fails to create a user' do
      params = {
        username: 'mikec',
        password: 'tester123'
      }

      post users_path, params: params

      expect(response.status).to eq(422)
      expect(JSON.parse(response.body)).to eq('message' => 'Account Not Created')
    end
  end

  describe 'POST users login' do
    xit 'logs a user in' do
      user = create(:user, password: '123')

      params = {
        email: user.email,
        password: user.password
      }

      post '/users/login', params: params

      expect(response.status).to eq(200)
    end
  end
end

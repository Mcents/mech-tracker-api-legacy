# frozen_string_literal: true

Rails.application.routes.draw do
  get '/current-user', to: 'users#show'

  resources :users, only: %i[create update] do
    collection do
      post 'login'
    end
  end

  resources :terms, only: %i[create index destroy] do
  end
end

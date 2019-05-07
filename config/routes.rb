Rails.application.routes.draw do

  get '/current-user', to: 'users#show'

  resources :users, only: [:create, :update] do
    collection do
      post 'login'
    end
  end

  resources :terms, only: [:create, :index, :destroy] do
  end
end

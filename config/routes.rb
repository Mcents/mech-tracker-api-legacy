Rails.application.routes.draw do

  resources :users, only: [:create, :update, :show] do
    collection do
      post 'login'
    end
  end
end

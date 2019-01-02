Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :games, only: [:index, :show, :create, :update]
      resources :rounds, only: [:index, :create, :update]
    end
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get "/users/leaderboard/:order", to: "users#leaderboard"
      resources :users, only: [:index, :show, :create, :update]
      resources :games, only: [:index, :show, :create, :update]
      resources :rounds, only: [:index, :show, :create, :update]
      get "/users/:id/stats", to: "users#stats"
    end
  end
end

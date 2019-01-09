Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      delete "/favorites", to: "favorites#destroy"
      resources :favorites, only: [:index, :create]
    end
  end
end

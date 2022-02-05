Rails.application.routes.draw do

  resources :attendees
  resources :events
  resources :favorite_games
  resources :groups
  resources :group_members
  resources :friends
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :games
  resources :home, only: [:index]
  resources :dashboards, only: [:index]
  # resources :users
  root to: "home#index"

  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
end

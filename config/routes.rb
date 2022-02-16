Rails.application.routes.draw do

  resources :chats
  resources :attendees, only: [:destroy]
  resources :events, only: [:destroy, :index, :show, :update] do
    resources :attendees, only: [:create]
    resources :chats, only: [:create]
  end
  resources :favorite_games
  resources :groups do 
    resources :events, only: [:create]
  end
  resources :group_members
  resources :friends
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :games
  resources :home, only: [:index]
  resources :dashboards, only: [:index]
  root to: "home#index"

  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
end

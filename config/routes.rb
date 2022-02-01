Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :games
  resources :dashboard, only: [:index]

  root to: "dashboards#index"

  devise_for :users, controllers: {
    confirmations: 'confirmations',
    sessions: 'users/sessions'
  }
end

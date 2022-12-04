Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :notes
  resources :subscriptions

  get :profile, to: 'users#profile'
end

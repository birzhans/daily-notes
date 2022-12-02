Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :notes

  get :profile, to: 'users#profile'
end

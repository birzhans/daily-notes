Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  authenticated :user do
    root "feed#index"
  end

  unauthenticated :user do
    root "home#index", as: :unauthenticated_root
  end

  resources :notes do
    get :calendar, on: :collection
  end
  resources :subscriptions

  get :profile, to: 'users#profile'
end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
   root 'measurements#index'
   resources :users, only: [:new] 
   resources :measurements, only: [:new, :create]
end

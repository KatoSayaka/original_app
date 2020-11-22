Rails.application.routes.draw do
  # get 'homes/top'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
   root to:'homes#top'
   resources :users, only: [:new] 
   resources :measurements, only: [:new, :create]
   resources :meal_records, only: [:index, :new, :create, :edit, :update, :destroy]
end

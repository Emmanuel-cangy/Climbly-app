Rails.application.routes.draw do
  devise_for :users
  root to: 'hikes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/hikes/map', to: 'hikes#map'

  resources :hikes, only: %i[index show edit update new create destroy] do
    resources :reviews, only: %i[index show new create]
    resources :scores, only: %i[index show new create]
  end
  get '/hikes/:id/destination', to: 'hikes#destination', as: 'destination'


  resources :reviews, only: %i[destroy edit update]

  resources :scores, only: %i[edit update destroy]

  get '/users/:user_id/scores', to: 'scores#display_scores'
end

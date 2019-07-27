Rails.application.routes.draw do

  # resources :properties
  # resources :user_properties

  root 'pages#home'
  get 'pages/about'
  get 'dashboard', to: 'pages#dashboard'

  devise_for :user

  get '/users/:id', to:'users#show'
  get '/users', to:'users#index'

  get 'pages/index'

  get '/all_properties' => 'properties#all_properties'

  resources :users, only: [:index, :show]

  resources :users do
    resources :properties, only: [:index, :new, :create]
  end
  resources :properties, only: [:show, :edit, :update, :destroy]




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  root 'pages#home'
  get 'pages/index'
  get 'pages/about'
  get 'pages/test_page'
  get 'dashboard', to: 'pages#dashboard'

  get 'directions/index'

  get '/all_clients' => 'clients#all_clients'

  devise_for :user
  get '/users/:id', to:'users#show'
  get '/users', to:'users#index'
  get '/users', to:'users#index'

  resources :users, only: [:index, :show]

  resources :users do
    resources :clients, only: [:index, :new, :create]
  end

  # resources :clients, only: [:show, :edit, :update, :destroy]
  resources :clients, only: [:show, :edit, :update, :destroy] do
    resources :projects, module: :clients
  end

  resources :projects
  get 'all_projects', to: 'projects#all_projects'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

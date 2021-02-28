Rails.application.routes.draw do

  # root 'pages#home'
  root 'pages#landing_page'
  get 'pages/index'
  get 'pages/about'
  get 'pages/test_page'
  get 'dashboard', to: 'pages#dashboard'

  get 'directions/index'

  get '/all_clients' => 'clients#all_clients'

  devise_for :user
  get '/users/:id', to:'users#show'
  # get '/users', to:'users#index'

  resources :search, only: [:index] do
    collection do
      get 'results'
    end
  end


  resources :users, only: [:show]

  resources :users do
    resources :clients, only: [:index, :new, :create]
  end

  resources :clients, only: [:show, :edit, :update, :destroy] do
    resources :projects, module: :clients
    resources :comments, module: :clients
    resources :checkins, module: :clients
    resources :notes, only: [:index, :new, :create]
  end

  resources :projects
  get 'all_projects', to: 'projects#all_projects'

  resources :projects, only: [:show, :edit, :update, :destroy] do
    resources :comments, module: :projects
    resources :checkins, module: :projects
    resources :notes, only: [:index, :new, :create]
  end

  resources :comments
  resources :checkins
  resources :notes





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

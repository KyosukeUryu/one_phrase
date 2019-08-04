Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  resources :phrases, only: [:new, :create, :destroy, :edit, :update, :show]
  resources :authors, only: [:index, :new, :create]
  resources :books, only: [:index, :new, :create]
end

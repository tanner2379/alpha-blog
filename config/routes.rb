Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # above is how you expose routes individually
  resources :articles
  resources :users, except: [:new]
end

Rails.application.routes.draw do

  resources :users
  
  get 'login',    to: 'sessions#new'
  post 'login',   to: 'sessions#create'
  post 'logout',  to: 'sessions#destroy'
  get 'welcome',  to: 'sessions#welcome'

  root 'sessions#welcome'
  
end

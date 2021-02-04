Rails.application.routes.draw do

  resources :events
  resources :users
  
  get 'login',    to: 'sessions#new'
  post 'login',   to: 'sessions#create'
  post 'logout',  to: 'sessions#destroy'
  get 'welcome',  to: 'sessions#welcome'

  post 'confirm_attendance',    to: 'event_attendances#create'
  delete 'cancel_attendance', to: 'event_attendances#destroy'

  root 'sessions#welcome'
  
end

Rails.application.routes.draw do
  resources :users
  resources :whatever_chats
  root 'home#index'
  get '/users/new', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/whatever', to: 'whatever_chats#index'
  get '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

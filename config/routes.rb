Rails.application.routes.draw do
  resources :users
  resources :whatever_chats
  root 'home#index'
  get '/', to: 'home#index'
  get '/users/new', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/whatever', to: 'whatever_chats#index'
  post '/post', to: 'whatever_chats#create'
  get '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  post '/whatever_chats/:id', to: 'comments#create'
  
  get '/to_me', to: 'whatever_chats#to_me'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

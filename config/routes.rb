Rails.application.routes.draw do

  root 'home#top'

  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :posts
  resources :messages 
  resources :users

  get "about" => "home#about"


end

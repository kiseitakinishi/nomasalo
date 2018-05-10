Rails.application.routes.draw do

  root 'home#top'

  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/reviews', to: 'reviews#create'

  resources :posts
  resources :messages
  resources :users
end

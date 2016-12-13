Rails.application.routes.draw do
  post '/logout' => 'sessions#destroy'
  post '/login' => 'sessions#create'
  get '/' => 'application#index'
  resources :sessions, except: ['destroy', 'create']
  get '/login' => 'sessions#new'
  get '/add_manually' => 'movies#manual'
  resources :users
  resources :choices 
  resources :directors
  resources :movies
#  post '/edit_user_movie' => 'movies#edit'
  resources :user_movies
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

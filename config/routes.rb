Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :choices 
  resources :directors
  resources :movies
  resources :user_movies
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

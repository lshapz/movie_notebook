Rails.application.routes.draw do

  resources :directors
  resources :movies
  get 'movies/choices', to:'movies#choices'
  post 'movies/choices', to:'movies#choices', as: "choose"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

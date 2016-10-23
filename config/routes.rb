Rails.application.routes.draw do

  resources :directors
  resources :movies
  match 'movies/choices' => 'movies#choices', via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

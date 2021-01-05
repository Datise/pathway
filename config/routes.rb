Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :feedbacks
  root 'home#show'
  get 'home/show'
  get 'dashboard' => 'dashboard#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'logout/logout' => 'logout#logout'
end

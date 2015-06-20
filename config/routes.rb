Rails.application.routes.draw do

  

  root 'bets#index'
  devise_for :users
  resources :users, only: [:show]
  resources :bets
  resources :friendship #not sure if this is correct yet.
  
end

Rails.application.routes.draw do

  root 'bets#index'
  devise_for :users
  resources :bets
  resources :friendship #not sure if this is correct yet.
  
end

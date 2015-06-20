Rails.application.routes.draw do

  root 'bets#index'
  devise_for :users
  resources :bets
  
end

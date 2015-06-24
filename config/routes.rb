Rails.application.routes.draw do
  root 'bets#index'
  devise_for :users
  resources :users, only: [:show]
  resources :bets do
    resources :memberships
  end
  resources :friendships #not sure if this is correct yet.
  resources :memberships
end

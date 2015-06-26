Rails.application.routes.draw do
  get 'contracts/index'

  get 'contracts/create'

  get 'contracts/update'

  get 'contracts/destroy'

  get 'rounds/index'

  get 'rounds/create'

  get 'rounds/update'

  get 'rounds/destroy'

  root 'bets#index'
  devise_for :users
  resources :users, only: [:show]
  resources :bets do
    resources :memberships
  end
  resources :friendships #not sure if this is correct yet.
  resources :memberships
end

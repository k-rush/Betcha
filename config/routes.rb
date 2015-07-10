Rails.application.routes.draw do
<<<<<<< HEAD
=======
  get 'contracts/index'

  get 'contracts/create'

  get 'contracts/update'

  get 'contracts/destroy'

  get 'rounds/index'

  get 'rounds/create'

  get 'rounds/update'

  get 'rounds/destroy'
>>>>>>> 06fc02ff6dd182e5b45027f7a26cf6aeb1705a59

  root 'bets#index'
  devise_for :users
  resources :users, only: [:show]
  resources :bets do
    resources :rounds do
      resources :contracts
    end
    resources :memberships #might be able to get rid of this
  end
<<<<<<< HEAD
  resources :friendships #not sure if this is correct yet.
  
=======
  resources :friendships
  resources :memberships
>>>>>>> 09d862b677376911e175cb1cce91273765a9a2fb
end

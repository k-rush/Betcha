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
    resources :rounds do
      resources :contracts
    end
    resources :memberships #might be able to get rid of this
  end

  
  resources :friendships
  resources :memberships

end

Rails.application.routes.draw do
  root 'baggages#index'
  resources :baggages, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'search'
    end
    resources :deliveries, only: [:index, :create]
  end
  get 'signup', to: 'users#new'
  resource :user, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create' 
  delete 'logout', to: 'sessions#destroy'
end
Rails.application.routes.draw do
  get 'home/top'
  resources :levels
  resources :records
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  get 'sessions/new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get    '/loginnew',  to: 'sessions#loginnew'
end


Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources 'users'

  namespace :admin do
    resources :levels
    resources :records
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tasks do
    collection do
      get 'sort_deadline'
      get 'narrow_down_status'
    end
  end
  root 'tasks#index'
  root 'users#index'
  get 'sessions/new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end

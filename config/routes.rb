Rails.application.routes.draw do
  resources :levels
  resources :records do
    member do
      post 'level_update'
    end
  end
  resources :users 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#login'
  delete '/logout', to: 'sessions#destroy'

  get    '/loginnew',  to: 'sessions#loginnew'
  post   '/loginnew',  to: 'sessions#create_user'

  
end


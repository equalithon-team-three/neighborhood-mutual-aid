Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :posts
    resources :users do
      resources :posts, only: [:index]
    end

  end

  post '/auth/check', to: 'auth#check'
  post '/auth/login', to: 'auth#login'
  post '/auth/register', to: 'auth#register'
  post '/auth/logout', to: 'auth#logout'

end

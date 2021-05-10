Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :posts
    resources :post_categories, only: [:index]
    resources :users do
      resources :posts, only: [:index]
    end
  end

  get '/auth/google_oauth2/callback', to: "auth#google_oauth2_callback"

  post '/auth/check', to: 'auth#check'
  post '/auth/login', to: 'auth#login'
  post '/auth/register', to: 'auth#register'
  post '/auth/logout', to: 'auth#logout'
end

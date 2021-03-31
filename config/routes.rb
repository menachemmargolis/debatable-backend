Rails.application.routes.draw do

  resources :catagories
  resources :replies
  resources :posts
  resources :topics
  
  post "/login", to: "users#login"
  post "/signup", to: "users#create"
  get "/users", to: "users#index"
  patch "/updateUsername", to: "users#updateUsername"
  patch "/updtateProfile", to: "users#updateProfilePhoto"
  get '/user', to: 'users#show'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

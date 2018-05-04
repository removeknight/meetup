Rails.application.routes.draw do
  get "signup" => "users#signup", :as => "signup"
  get "login" => "users#login", :as => "login"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'page#welcome'
  get '/about' => 'page#about'
  post "create_login_session" => "users#create_login_session"
  delete "logout" => "users#logout", :as => "logout"

  resources :users, only: [:create]
  resources :comments, only: [:create]
  resources :issues

end

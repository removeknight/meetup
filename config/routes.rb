Rails.application.routes.draw do
  get "signup" => "users#signup", :as => "signup"
  get "login" => "users#login", :as => "login"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'page#welcome'
  get '/about' => 'page#about'
  post "create_login_session" => "users#create_login_session"
  delete "logout" => "users#logout", :as => "logout"


  # #issue
  # get 'issues/new' => 'issues#new'
  # get 'issues' => 'issues#index', :as => 'issues'
  # get 'issues/:id' => 'issues#show', :as => 'issue'
  # delete 'issues/:id' => 'issues#destroy'
  # post '/issues' => 'issues#create'
  # get 'issues/:id/edit' => 'issues#edit', :as => 'edit_issue'
  # patch 'issues/:id' => 'issues#update'
  resources :users, only: [:create]
  resources :comments, only: [:create]

  resources :issues
end

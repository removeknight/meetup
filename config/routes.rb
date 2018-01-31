Rails.application.routes.draw do
  get "signup" => "users#signup", :as => "signup"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'page#welcome'
  get '/about' => 'page#about'


  # #issue
  # get 'issues/new' => 'issues#new'
  # get 'issues' => 'issues#index', :as => 'issues'
  # get 'issues/:id' => 'issues#show', :as => 'issue'
  # delete 'issues/:id' => 'issues#destroy'
  # post '/issues' => 'issues#create'
  # get 'issues/:id/edit' => 'issues#edit', :as => 'edit_issue'
  # patch 'issues/:id' => 'issues#update'

  resources :issues
  post '/issues/:issue_id/comments' => "comments#create"
end

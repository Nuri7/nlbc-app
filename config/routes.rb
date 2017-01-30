Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :numbers
  resources :teams
  post 'teams/new', to: 'teams#multicreate'
  post 'delete_all', to: 'teams#delete_all'
  get 'delete-users', to: 'welcome#all_users'
  delete 'delete_user', to: 'welcome#delete_user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

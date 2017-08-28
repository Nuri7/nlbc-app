Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :teams
  resources :passions
  resources :feedbacks

  get 'programming', to: 'welcome#programming'
  get 'dancing', to: 'welcome#dancing'
  get 'photography', to: 'welcome#photography'
  get 'boxing', to: 'welcome#boxing'
  get 'qajava', to: 'welcome#qajava'
  get 'trainers', to: 'welcome#trainers'

  post 'teams/new', to: 'teams#multicreate'
  post 'delete_all', to: 'teams#delete_all'
  get 'delete-users', to: 'welcome#all_users'
  delete 'delete_user', to: 'welcome#delete_user'
  post 'subscribe_to_passion', to: 'welcome#subscribe_to_passion'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

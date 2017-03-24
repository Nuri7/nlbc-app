Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :numbers
  resources :teams
  resources :passions
  resources :feedbacks, except: :new
  get 'new-feedback', to: 'feedbacks#new', as: 'new_feedback'
  post 'teams/new', to: 'teams#multicreate'
  post 'delete_all', to: 'teams#delete_all'
  get 'delete-users', to: 'welcome#all_users'
  delete 'delete_user', to: 'welcome#delete_user'
  post 'subscribe_to_passion', to: 'welcome#subscribe_to_passion'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

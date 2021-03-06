Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations', sessions: 'sessions' }
  root 'nlbc#index'
  resources :passions
  resources :feedbacks
  resources :contacts, only: :create
  namespace :teachers do
    get :teacher_information
  end

  # for stripe
  resources :charges

  namespace :nlbc do
    get :dropdown_challenges
    get :dropdown_passions
    get :privacy
    get :find_a_trainer
    get :remove_users
    get :teach
    get :enterprise
    get :vision
    get :bootcamps
    post :subscribe_to_passion
    delete :delete_user
  end

  resources :teams do
    collection do
      post :multicreate
      post :delete_all
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

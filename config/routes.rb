Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations' }
  root 'nlbc#index'
  resources :passions
  resources :feedbacks

  # for stripe
  resources :charges

  namespace :nlbc do
    get :dropdown_challenges
    get :privacy
    get :programming
    get :dancing
    get :photography
    get :boxing
    get :qajava
    get :trainers
    get :remove_users
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

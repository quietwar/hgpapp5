Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }
    devise_scope :user do
      get 'tap_in', to: 'devise/sessions#new'
      get 'genius_signup', to: 'devise/registrations#new'
    end

    devise_for :admin_users, ActiveAdmin::Devise.config.merge(:path => :admin)
      ActiveAdmin.routes(self)
        #resources :admin_users, controller: 'admin/registrations'
  # devise_scope :admin do
  #      #get "/staff/sign_in", to: " admin/sessions#new" # custom path to login/sign_in
        get "/staff/sign_up", to: "active_admin/devise/registrations#new"  # custom path to sign_up/registration
  #   #   get "staff/sign_out" => " admins/sessions#destroy" # "destroy_admin_user_session"
        match 'admin/classrooms/show', to: 'classrooms#index', :via => :post

        #post "admin/classrooms#index" => "classrooms#index"
#end
# # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

      resources :users, only: [:index, :show] do
        resources :projects
      resources :cohorts, only: [:index, :show]
      resources :classrooms, only: [:index, :show]
        collection do
          post :search, to: 'classrooms#search'
        end
      end

      resources :features
      resources :friendships, only: [:show, :create, :destroy]
      resources :messages, only: [:create]
    root to: "classrooms#index"
    mount ActionCable.server => '/cable'

    #end
  end

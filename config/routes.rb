Rails.application.routes.draw do

  devise_for :admins, :controllers => { registrations: "admins/registrations" }
  devise_for :users, :controllers => { registrations: 'registrations' }
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

        get "/staff/sign_in" => "active_admin/devise/sessions#new", as: "new_admins_user_session" # custom path to login/sign_in
        get "/staff/sign_up" => "active_admin/devise/registrations#new", as: "new_admins_user_registration" # custom path to sign_up/registration
        #get "genius/sign_out" => "devise/sessions#destroy", as: "destroy_user_session"
        get "staff/sign_out" => "active_admin/devise/sessions#destroy", as: "destroy_admin_user_session"
        get 'signup' => 'users/devise/registrations#new', :as => :signup
        get 'logout' => 'sessions#destroy', :as => :logout
        get 'login' => 'sessions#new', :as => :login

        resources :projects
        resources :users, only: [:index, :show] do
          #namespace :admin, only: [:index] do
        resources :cohorts, only: [:index, :show]
        resources :classrooms, only: [:index, :show]
          collection do
            post :search, to: 'classrooms#search'
          end
        end


        match "/404", :to => "errors#not_found", :via => :all
        match "/500", :to => "errors#internal_server_error", :via => :all

          resources :features
          resources :friendships, only: [:show, :create, :destroy]
          resources :messages, only: [:create]
        root to: "classrooms#index"
        mount ActionCable.server => '/cable'

      end

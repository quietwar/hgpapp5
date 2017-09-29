Rails.application.routes.draw do
  ActiveAdmin.routes(self)
   devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
   namespace :api do
     namespace :v1 do
       resources :users
     end
   end

   resources :users
      devise_scope :user do
        get '/redirect', to: 'events#redirect', as: 'redirect'
        get '/callback', to: 'events#callback', as: 'callback'
        get '/calendars', to: 'events#calendars', as: 'calendar'
        get '/events/:calendar_id', to: 'events#events', as: 'hgp_event', calendar_id: /[^\/]+/
        post '/events/:calendar_id', to: 'events#new_event', as: 'new_hgp_event', calendar_id: /[^\/]+/
        get 'tap_in', to: 'devise/sessions#new'
        get 'genius_signup', to: 'devise/registrations#new'
        get 'auth/:google_oauth2/callback', to: 'authentications#create', as: 'google_signin'
        get 'signout', to: 'sessions#destroy', as: 'signout'
        #registration seems to much cooler for authenticable and other stuff
        #match 'api/v1/users' , to: 'registrations#create' , via: :post
      end
  #    devise_for :users,  controllers: { omniauth_callbacks: "omniauth_callbacks" }
  #   devise_scope :user do
  #     get '/redirect', to: 'events#redirect', as: 'redirect'
  #     get '/callback', to: 'events#callback', as: 'callback'
  #     get '/calendars', to: 'events#calendars', as: 'calendar'
  #     get '/events/:calendar_id', to: 'events#events', as: 'hgp_event', calendar_id: /[^\/]+/
  #     post '/events/:calendar_id', to: 'events#new_event', as: 'new_hgp_event', calendar_id: /[^\/]+/
  #     get 'tap_in', to: 'devise/sessions#new'
  #     get 'genius_signup', to: 'devise/registrations#new'
  #     get 'auth/:google_oauth2/callback', to: 'authentications#create', as: 'google_signin'
  #     get 'signout', to: 'sessions#destroy', as: 'signout'
  #   end
  #
  # devise_for :admin_users, ActiveAdmin::Devise.config.merge(:path => :admin)
  #   ActiveAdmin.routes(self) do
  #   get "/staff/sign_up", to: "active_admin/devise/registrations#new"
  #   match 'admin/classrooms/show', to: 'classrooms#index', :via => :post
  # end
     resources :events

# # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

      resources :users do
        resources :projects
      resources :features,only: [:create]
      resources :cohorts, only: [:index, :show]
      resources :classrooms, only: [:index, :show]
        collection do
          post :search, to: 'classrooms#search'
        end
      end

      resources :friendships, only: [:show, :create, :destroy] do
      resources :messages, only: [:create]
        end
      #get "/auth/:provider/callback" => "authentications#create"
      root to: "classrooms#index"
    mount ActionCable.server => '/cable'

    #end
  end

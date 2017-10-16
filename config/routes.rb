Rails.application.routes.draw do
  ActiveAdmin.routes(self)
   devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

   resources :users do
     resources :projects
     end

      devise_scope :user do
        get '/events', to: 'events#index'
        get '/events/new', to: 'events#new'
        get '/events/1/', to: 'events#show', :id => "1"
        get '/events/1/edit/', to: 'events#edit', :id => "1"
        post '/events', to: 'events#create'
        #post '/new_event', to: 'events#create'
        delete "/events/1", to: "events#destroy", :id => "1"
        put "/events/1", to: "events#update", :id => "1"
        patch "/events/1", to: "events#update", :id => "1"
        get 'user_google_oauth2_omniauth_authorize_path', to: 'events#calendars', as: 'calendars'
        get '/redirect', to: 'events#redirect', as: 'redirect'
        get '/callback', to: 'events#callback', as: 'callback'
        get '/events/:calendar_id', to: 'events#events', as: 'hgp_event', calendar_id: /[^\/]+/
        post '/events/:calendar_id', to: 'events#new_event', as: 'new_hgp_event', calendar_id: /[^\/]+/
        get 'tap_in', to: 'devise/sessions#new'
        get 'genius_signup', to: 'devise/registrations#new'
        get 'auth/:google_oauth2/callback', to: 'authentications#create', as: 'google_signin'
        get 'signout', to: 'sessions#destroy', as: 'signout'
      end
    match 'api/v1/users' , to: 'registrations#create' , via: :post

  # devise_for :admin_users, ActiveAdmin::Devise.config.merge(:path => :admin)
  #   ActiveAdmin.routes(self) do
  #   get "/staff/sign_up", to: "active_admin/devise/registrations#new"
  #   match 'admin/classrooms/show', to: 'classrooms#index', :via => :post
  # end


# # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


      resources :features,only: [:create]
      resources :cohorts, only: [:index, :show]
      resources :classrooms, only: [:index, :show, :search] do
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

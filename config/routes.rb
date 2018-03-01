Rails.application.routes.draw do

  get "/admin/cohort/:id", id: 'Rich1', controller: "admin/cohort", action: "show"
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config.merge(:path => :active_admin)
  devise_for :users, :controllers => { :omniauth_callbacks => "users#omniauth_callbacks" }
      resources :users do
        resources :projects
      end

      devise_scope :user do
          #get '/admin/', to: 'classrooms#index'
          get 'admin_login', to: 'active_admin/devise/sessions#new'#, as: 'Staff Tap-in'
          post 'admin_login', to: 'active_admin/devise/sessions#new'
          #'admin/cohort/rich1', to: 'admin/cohort#show('rich1')'
          #post '/admin/cohorts/new', to: 'cohorts#new'
          get 'admin_signup', to: 'active_admin/devise/registrations#new'
          get '/users/:user_id/projects', to: 'projects#index', as: 'projects'
          get '/users/:user_id/projects/new', to: 'projects#new', as: 'new_project'
          post '/users/:user_id/projects/new', to: 'projects#new'
          post '/users/:user_id/projects', to: 'projects#create'
          get '/users/:user_id/projects/:id', to: 'projects#show', as: 'project'
          get '/users/:user_id/projects/:id/edit', to: 'projects#edit', as: 'edit_project'
          patch '/users/:user_id/projects/:id', to: 'projects#update'
          put    '/users/:user_id/projects/:id', to: 'projects#update'
          delete '/users/:user_id/projects/:id', to: 'projects#destroy', as: 'delete_project'
          get '/calendars', to: 'events#calendars', as: 'calendars'
          get '/redirect', to: 'events#redirect', as: 'redirect'
          get '/callback', to: 'events#callback', as: 'callback'
          get '/events/:calendar_id', to: 'events#events', as: 'event', calendar_id: /[^\/]+/
          post '/events/:calendar_id', to: 'events#new_event', as: 'new_event', calendar_id: /[^\/]+/
          get 'tap_in', to: 'devise/sessions#new'
          post 'tap_in', to: 'classrooms#index'
          get 'genius_signup', to: 'devise/registrations#new'
          get 'auth/google_oauth2/callback', to: 'users#create', as: 'google_signin'
          get 'signout', to: 'devise/sessions#destroy', via: 'destroy'
          post 'signout', to: 'classrooms#index'
      end
    #end
  # scope :api do
  #   scope :v1 do
  #     #resources :<controller_name>, except: [:new, :edit]
  #     get 'api/v1/users' , to: 'registrations#create' , via: :post
  #   end
  # end



# # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



      resources :features,only: [:create]
      resources :cohorts, only: [:index, :show]
      resources :classrooms do
        resources :attendances
        collection do
          post :search, to: 'classrooms#search'
        end
      end

      resources :friendships, only: [:show, :create, :destroy] do
      resources :messages, only: [:create]
        end
      root to: "classrooms#index"
    mount ActionCable.server => '/cable'

    #end
  end

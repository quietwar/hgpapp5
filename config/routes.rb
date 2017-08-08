Rails.application.routes.draw do
  devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)
  get 'cohorts/index'

  #devise_for :admins, :controllers => { registrations: 'registrations' }
  #devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "dashboards#index"
  devise_for :users
    resources :users, only: [:index, :show] do
    resources :projects

  end


  resources :dashboards, only: [:index] do
    collection do
      post :search, to: 'dashboards#search'
    end
  end

  namespace :admin do
    resources :cohorts, only: [:index, :show]
    resources :classrooms, only: [:index, :show]
  end
    resources :features
    resources :friendships, only: [:show, :create, :destroy]
    resources :messages, only: [:create]

  mount ActionCable.server => '/cable'

end

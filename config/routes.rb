Rails.application.routes.draw do
  get 'users/index'

  devise_for :admins, :controllers => { registrations: 'registrations' }
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "dashboards#index"

  resources :users, only: [:index, :show] do
    resources :projects

  end

   namespace :admins do
        resources :cohorts

        root to: "cohorts#index"
      end

  resources :dashboards, only: [:index] do
    collection do
      post :search, to: 'dashboards#search'
    end
  end

  resources :admin

  resources :features
  resources :friendships, only: [:show, :create, :destroy]
  resources :messages, only: [:create]

  mount ActionCable.server => '/cable'

end

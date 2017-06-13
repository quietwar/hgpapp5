Rails.application.routes.draw do
  devise_for :admins, :controllers => { registrations: "admin/registrations" }
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "dashboards#index"

  resources :users, only: [:index, :show] do
    resources :projects

  end

  resources :dashboards, only: [:index] do
    collection do
      post :search, to: 'dashboards#search'
    end
  end

    namespace :admins do
      resources :cohorts

      root to: "cohorts#index"

end

  resources :features, only: [:index, :show, :create, :destroy]
  resources :friendships, only: [:show, :create, :destroy]
  resources :messages, only: [:create]

  mount ActionCable.server => '/cable'

end

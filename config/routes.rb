Rails.application.routes.draw do
   get 'users/index'
   get 'projects/index'
   get 'classrooms/index'

  devise_for :admins, :controllers => { registrations: "staffs/registrations" }
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

  resources :features, only: [:index, :show, :create, :destroy]
  resources :friendships, only: [:show, :create, :destroy]
  resources :messages, only: [:create]

  mount ActionCable.server => '/cable'

end

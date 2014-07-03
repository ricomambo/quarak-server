require 'api_constraints'

Rails.application.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do

      resources :projects, except: [:new, :edit] do
        resources :expenses, except: [:new, :edit]
      end

      resources :users, only: [:index]

      post 'sign_up', to: 'users#create'
      post 'sign_in', to: 'sessions#create'
      delete 'sign_out', to: 'sessions#destroy'
      get 'profile', to: 'users#show'
      put 'profile', to: 'users#update'
      patch 'profile', to: 'users#update'

    end
  end

  root 'home#index'

  # Any other routes are handled here (as ActionDispatch prevents RoutingError from hitting ApplicationController::rescue_action).
  match "*path", :to => 'application#routing_error', :via => :all
end

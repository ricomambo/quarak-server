require 'api_constraints'

Rails.application.routes.draw do

  scope :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      devise_for :users, :controllers => {:registrations => "api/v1/registrations", :sessions => "api/v1/sessions"}
    end
  end

  namespace :api, :defaults => {:format => :json} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :projects do
        resources :expenses
        resources :members, controller: :users
      end
      resources :users, only: [:index]
    end
  end

  # Any other routes are handled here (as ActionDispatch prevents RoutingError from hitting ApplicationController::rescue_action).
  match "*path", :to => "application#routing_error", :via => :all
end

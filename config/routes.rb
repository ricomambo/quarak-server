require 'api_constraints'

Rails.application.routes.draw do

  scope :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      devise_for :users, :controllers => {:registrations => "api/v1/registrations", :sessions => "api/v1/sessions"}
    end
  end

  namespace :api, :defaults => {:format => :json} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :expenses
      resources :projects
      resources :users, only: [:index]
    end
  end

end

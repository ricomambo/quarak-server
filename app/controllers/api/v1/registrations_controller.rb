module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      skip_before_filter :restrict_access_by_token, :only => :create
      respond_to :json

      def create
        user = User.new(sign_up_params)
        if user.save
          render :json => user, :status => :created
          return
        else
          warden.custom_failure!
          render :json => user.errors, :status => :unprocessable_entity
        end
      end
    end
  end
end

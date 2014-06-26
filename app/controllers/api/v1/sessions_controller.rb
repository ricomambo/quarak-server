module Api
  module V1
    class SessionsController < ApplicationController
      wrap_parameters :user

      skip_before_filter :authenticate_token!, only: [:create]

      def create
        if params[:email] && params[:password]
          @current_user = User.authenticate(params[:email], params[:password])
          head :unauthorized unless @current_user
        else
          head :bad_request
        end
      end

      def destroy
        @current_user.reset_token!
        head :ok
      end
    end
  end
end

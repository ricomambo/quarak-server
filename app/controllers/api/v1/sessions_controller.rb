module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_filter :authenticate_token!, only: [:create]

      def create
        if params[:user]
          @current_user = User.authenticate(params[:user][:email], params[:user][:password])
          render json: @current_user.as_json(only: [:id, :name, :token])
        end
      end

      def destroy
        @current_user.reset_token!
        head :ok
      end
    end
  end
end

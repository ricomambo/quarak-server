module Api
  module V1
    class UsersController < ApplicationController
      skip_before_filter :authenticate_token!, only: [:create]

      def index
        @users = User.all
      end

      def show
        @user = @current_user
      end

      def create
        @user = User.new(user_params)

        unless @user.save
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update
        unless @current_user.update(user_params)
          render json: @current_user.errors, status: :unprocessable_entity
        end
      end

      private
        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
          params.require(:user).permit(:email, :password, :name)
        end
    end
  end
end

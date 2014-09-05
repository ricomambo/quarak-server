module Api
  module V1
    class UsersController < ApiController
      skip_before_filter :authenticate_token!, only: [:create]
      respond_to :json

      def index
        @users = User.all
      end

      def show
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

      def balance
        @balances = @current_user.balances
      end

      private
        def user_params
          params.require(:user).permit(:email, :password, :name, :active)
        end
    end
  end
end

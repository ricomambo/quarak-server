module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
      end
    end
  end
end

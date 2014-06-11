module Api
  module V1
    class UsersController < ApplicationController
      def index
        if params[:project_id]
          project = Project.find(params[:project_id])
          authorize project, :show?
          @users = project.members
        else
          @users = User.all
        end
      end
    end
  end
end

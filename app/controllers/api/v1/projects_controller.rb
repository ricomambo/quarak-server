module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :set_project, only: [:show, :edit, :update, :destroy]

      def index
        @projects = @current_user.projects
      end

      def show
      end

      def new
        @project = Project.new
      end

      def edit
      end

      def create
        @project = Project.new(project_params)

        if @project.save
          render :show, status: :created, location: api_project_url(@project)
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      def update
        if @project.update(project_params)
          render :show, status: :ok, location: api_project_url(@project)
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @project.destroy
        head :no_content
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_project
          @project = Project.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def project_params
          params.require(:project).permit(:title)
        end
    end
  end
end

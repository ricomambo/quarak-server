module Api
  module V1
    class ProjectsController < ApiController
      wrap_parameters include: [:title, :member_ids]
      before_action :set_project, only: [:show, :update, :destroy, :balance]

      def index
        @projects = policy_scope(Project)
      end

      def show
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

      def balance
        #@users = [{id: 1, name: "Luis", balance: "1000"}, {id: 2, name: "Jorge", balance: "-500"}]
        @users = @project.balance
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_project
          @project = Project.find(params[:id] || params[:project_id])
          authorize @project
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def project_params
          params.require(:project).permit(:title, :member_ids => [])
        end
    end
  end
end

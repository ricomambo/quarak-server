module Api
  module V1
    class SettlementsController < ApiController
      def index
        @project = Project.find(params[:project_id])
        @settlements = @project.settlements.order(id: :desc)
      end
    end
  end
end

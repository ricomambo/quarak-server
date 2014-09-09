module Api
  module V1
    class SettlementsController < ApiController

      def index
        @project = Project.find(params[:project_id])
        @settlements = @project.settlements.order(id: :desc)
      end

      def create
        @project = Project.find(params[:project_id])
        @settlement = @project.settlements.build(settlement_params)

        if @settlement.save
          render 'show'
        else
          render json: @settlement.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @project = Project.find(params[:project_id])
        @settlement = @project.settlements.find(params[:id])
        @settlement.destroy!
        head :no_content
      end

      private

      def settlement_params
        params.require(:settlement).permit(
          :project_id, :payer_id, :payee_id, :amount
        )
      end

    end
  end
end

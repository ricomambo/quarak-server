module Api
  module V1
    class ExpensesController < ApplicationController
      before_action :set_project
      before_action :set_expense, only: [:show, :edit, :update, :destroy]

      def index
        @expenses = @project.expenses
      end

      def show
      end

      def new
        @expense = @project.expenses.new
      end

      def edit
      end

      def create
        @expense = @project.expenses.new(expense_params)

        if @expense.save
          render :show, status: :created, location: api_project_expense_url(@project, @expense)
        else
          render json: @expense.errors, status: :unprocessable_entity
        end
      end

      def update
        if @expense.update(expense_params)
          render :show, status: :ok, location: api_project_expense_url(@project, @expense)
        else
          render json: @expense.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @expense.destroy
        head :no_content
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_expense
          @expense = @project.expenses.find(params[:id])
        end

        def set_project
          @project = Project.find(params[:project_id])
          authorize @project, :show?
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def expense_params
          params.require(:expense).permit(:date, :category, :provider, :amount, :payer_id, :comments, :member_ids => [])
        end
    end
  end
end

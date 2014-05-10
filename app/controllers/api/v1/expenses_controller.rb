module Api
  module V1
    class ExpensesController < ApplicationController
      before_action :set_expense, only: [:show, :edit, :update, :destroy]

      def index
        @expenses = Expense.all
      end

      def show
      end

      def new
        @expense = Expense.new
      end

      def edit
      end

      def create
        @expense = Expense.new(expense_params)

        if @expense.save
          render :show, status: :created, location: api_expense_url(@expense)
        else
          render json: @expense.errors, status: :unprocessable_entity
        end
      end

      def update
        if @expense.update(expense_params)
          render :show, status: :ok, location: api_expense_url(@expense)
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
          @expense = Expense.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def expense_params
          params.require(:expense).permit(:date, :category, :provider, :amount, :payer, :members, :comments)
        end
    end
  end
end

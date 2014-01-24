class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :update, :destroy]
  
  def index
    if params[:member_id]
      render json: Member.find(params[:member_id]).expenses
    else
      render json: Expense.all
    end
  end

  def show
    render json: Expense.find(params[:id])
  end

  def create
    expense = Expense.new(expense_params)

    if expense.save
      render json: expense, status: :created
    else
      render json: expense.errors, status: :unprocessable_entity
    end
  end

  def update
    if @expense.update(expense_params)
      render json: @expense, status: :updated
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy
    head :no_content
  end

  private
    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:title, :category, :provider, :comments, :amount, :date, :payer_id)
    end
end

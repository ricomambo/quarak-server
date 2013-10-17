class ExpensesController < ApplicationController
  def index
    if params[:member_id]
      render json: Member.find(params[:member_id]).expenses
    else
      render json: Expense.all.to_json(include: :payer)
    end
  end

  def show
    render json: Expense.find(params[:id]).to_json(include: :payer)
  end
end

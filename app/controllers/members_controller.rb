class MembersController < ApplicationController
  def index
    if params[:expense_id]
      render json: Expense.find(params[:expense_id]).members
    else
      render json: Member.all
    end
  end

  def show
    render json: Member.find(params[:id])
  end
end

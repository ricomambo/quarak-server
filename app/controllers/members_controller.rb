class MembersController < ApplicationController
  before_action :set_member, only: [:show, :update, :destroy]

  def index
    if params[:expense_id]
      render json: Expense.find(params[:expense_id]).members
    else
      render json: Member.all
    end
  end

  def show
    render json: @member
  end

  def create
    member = Member.new(member_params)

    if member.save
      render json: member, status: :created
    else
      render json: member.errors, status: :unprocessable_entity
    end
  end

  def update
    if @member.update(member_params)
      render json: @member, status: :updated
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @member.destroy
    head :no_content
  end

  private
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:name)
    end
end

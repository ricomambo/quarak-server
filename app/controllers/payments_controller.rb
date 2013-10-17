class PaymentsController < ApplicationController
  def index
    render json: Member.find(params[:member_id]).payments
  end
end
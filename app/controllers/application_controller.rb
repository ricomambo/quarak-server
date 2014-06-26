class ApplicationController < ActionController::Base
  include Pundit
  respond_to :json

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :authenticate_token!

  def routing_error
    raise ActionController::RoutingError.new("No route matches #{params[:path]}")
  end

  protected

    def current_user=(user)
      @current_user = user
    end

    def current_user
      @current_user
    end

    def authenticate_token!
      authenticate_or_request_with_http_token do |token, options|
        @current_user = User.find_by_token(token)
        @current_user ||= false
      end
    end

  private

    def handle_errors(exception)
      render json: { errors: { error: exception.message, baktrace: exception.backtrace } }.to_json, status: :internal_server_error
    end

end

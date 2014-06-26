class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :null_session

  before_filter :authenticate_token!

  def routing_error
    raise ActionController::RoutingError.new("No route matches #{params[:path]}")
  end

  rescue_from Exception, with: :handle_errors
  rescue_from Pundit::NotAuthorizedError, with: :permission_errors

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

    def permission_errors(exception)
      render json: { error: exception.message }.to_json, status: :unauthorized
    end

    def handle_errors(exception)
      #render json: { error: exception.message, baktrace: exception.backtrace }.to_json, status: :internal_server_error
      render json: { error: exception.message }.to_json, status: :internal_server_error
    end

end

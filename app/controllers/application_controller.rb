class ApplicationController < ActionController::Base
  include Pundit
  respond_to :json

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :restrict_access_by_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  def routing_error
    raise ActionController::RoutingError.new("No route matches #{params[:path]}")
  end

  rescue_from Exception, with: :handle_errors

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def request_http_token_authentication(realm = "Application")
    self.__send__ :render, :json => { :error => "HTTP Token: Access denied. You did not provide a valid token." }.to_json, :status => :unauthorized
  end

  private

    def restrict_access_by_token
      authenticate_or_request_with_http_token do |token, options|
        @current_user = User.find_by_authentication_token(token)
        @current_user ||= false
      end
    end

    def handle_errors(exception)
      render :json => { :errors => { :error => exception.message, :baktrace => exception.backtrace } }.to_json, :status => :internal_server_error
    end

end

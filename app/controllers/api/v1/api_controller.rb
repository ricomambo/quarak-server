module Api
  module V1
    class ApiController < ApplicationController
      include Pundit

      before_filter :authenticate_token!

      def routing_error
        raise ActionController::RoutingError.new("No route matches #{params[:path]}")
      end

      if Rails.env.development?
        rescue_from Exception, with: :render_error
      end

      rescue_from Pundit::NotAuthorizedError, with: :render_forbidden

      protected

        def current_user=(user)
          @current_user = user
        end

        def current_user
          @current_user
        end

        def authenticate_token!
          authenticate || render_unauthorized
        end

        def authenticate
          authenticate_with_http_token do |token, options|
            @current_user = User.find_by_token(token)
          end
        end

      private

        def render_unauthorized
          render json: { error: 'Authentication Required' }.to_json, status: :unauthorized
        end

        def render_forbidden(exception)
          render json: { error: exception.message }.to_json, status: :forbidden
        end

        def render_error(exception)
          #render json: { error: exception.message, baktrace: exception.backtrace }.to_json, status: :internal_server_error
          render json: { error: exception.message }.to_json, status: :internal_server_error
        end

    end
  end
end

module RequestsHelper
  def json
    @json ||= JSON.parse(response.body).deep_symbolize_keys!
  end

  def user_auth_header(user)
    auth_header(user.token)
  end

  def auth_header(token)
    { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(token) }
  end
end

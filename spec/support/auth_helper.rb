# AuthHelper module
module AuthHelper
  def authenticated_header(user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token

    @request.headers['Authorization'] = "Bearer #{token}"
  end
end

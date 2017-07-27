# AuthHelper module
module AuthHelper
  def authenticated_header(user)
    token = JWT.encode('8f79f00025a9035d2535f0a59b81de774ac5cf2f3b456da21f1c999039c640326954ef7c8dd233ae5e5304b0230cb29398d7dcea4d91b5c708886649b5741e16',
                       user.password.last(8),
                       'HS256')

    @request.headers['Authorization'] = "Bearer #{token}"
  end
end

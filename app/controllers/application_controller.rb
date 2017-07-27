# Application Controller
class ApplicationController < ActionController::API
  include Knock::Authenticable
end

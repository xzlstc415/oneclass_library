# Application Controller
class ApplicationController < ActionController::API
  include Knock::Authenticable
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found(_exception)
    head :not_found
  end
end

# SignUpController
class SignUpController < ApplicationController
  def create
    @user = User.new(sign_up_params)
    if @user.save
      head :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.permit(:email, :password)
  end
end

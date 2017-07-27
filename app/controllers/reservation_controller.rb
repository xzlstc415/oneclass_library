# ReservationController
class ReservationController < ApplicationController
  before_action :authenticate_user
  before_action :set_book

  def update
    case params[:act]
    when 'reserve'
      result = @book.reserve
    when 'return'
      result = @book.return
    end
    if result
      head :ok
    else
      render json: { errors: @book.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end

# BooksController
class BooksController < ApplicationController
  before_action :authenticate_user

  def index
    @books = Book.search(search_params)
                 .result
                 .uniq
    render json: @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: :created
    else
      render json: { errors: @book.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(
      :name,
      :isbn,
      :quantity
    )
  end

  def search_params
    params.permit(
      :name_cont,
      :isbn_eq
    )
  end
end

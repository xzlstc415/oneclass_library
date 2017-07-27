require 'rails_helper'
include AuthHelper

describe ReservationController do
  let(:user) { create(:user) }
  let(:book) { create(:book, quantity: 10, reserved: 9) }
  context "PUT update" do
    context "when reserving" do
      it "allows to reserve a book if quantity - reserved is bigger than 0" do
        authenticated_header(user)
        put :update, id: book.id, act: 'reserve', format: :json
        book.reload
        expect(book.reserved).to eq 10
        expect(response).to be_success
      end

      it "does not allow to reserve a book if quantity - reserved is smaller or equal than 0" do
        authenticated_header(user)
        book.reserve
        put :update, id: book.id, act: 'reserve', format: :json
        book.reload
        expect(book.reserved).to eq 10
        expect(response).to be_unprocessable
      end
    end

    context "when returning" do
      it "allows to return a book" do
        authenticated_header(user)
        put :update, id: book.id, act: 'return', format: :json
        book.reload
        expect(book.quantity).to eq 10
        expect(response).to be_success
      end
    end
  end
end

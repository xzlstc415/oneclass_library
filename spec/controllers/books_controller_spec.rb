require 'rails_helper'
include AuthHelper

describe BooksController do
  let(:user) { create(:user) }
  context "POST create" do
    it "allows to create a new book" do
      authenticated_header(user)
      book_attributes = attributes_for(:book)
      expect {
        post :create, book: book_attributes, format: :json
      }.to change { Book.count }.by 1
      expect(response).to be_created
    end

    it "does not allow to create a new book if required fields are missing" do
      authenticated_header(user)
      book_attributes = attributes_for(:book)
      book_attributes[:isbn] = nil
      expect {
        post :create, book: book_attributes, format: :json
      }.to change { Book.count }.by 0
      expect(response).to be_unprocessable
    end
  end

  context "GET index" do
    it "allow search books by name" do
      @book1 = create(:book, name: 'abc')
      @book2 = create(:book, name: 'abc2')
      create(:book, name: 'nothing similar')
      authenticated_header(user)
      get :index, name_cont: @book1.name, format: :json
      expect(response).to be_success
      expect(assigns[:books]).to match_array [@book1, @book2]
    end

    it "allow search books by isbn" do
      @book1 = create(:book, isbn: 'abc')
      create(:book, isbn: 'wrong isbn')
      authenticated_header(user)
      get :index, isbn_eq: @book1.isbn, format: :json
      expect(response).to be_success
      expect(assigns[:books]).to match_array [@book1]
    end
  end

  context "GET show" do
    it "get the requested book if it exist" do
      @book1 = create(:book, name: 'book1')
      authenticated_header(user)
      get :show, id: @book1.id, format: :json
      expect(assigns[:book].id).to eq @book1.id
      expect(response).to be_success
    end

    it "returns not found if it does not exist" do
      authenticated_header(user)
      get :show, id: 999, format: :json
      expect(response).to be_not_found
    end
  end
end

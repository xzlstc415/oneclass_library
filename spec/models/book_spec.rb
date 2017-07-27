require 'rails_helper'

describe Book do
  let(:book) { build(:book) }

  it 'has a valid factory' do
    expect(book).to be_valid
  end

  it "is invalid without name" do
    book.name = nil
    expect(book).to be_invalid
  end

  it "is invalid without isbn" do
    book.isbn = nil
    expect(book).to be_invalid
  end

  it "is invalid without quantity" do
    book.quantity = nil
    expect(book).to be_invalid
  end

  it "is invalid when reserved is bigger than quantity" do
    book.quantity = 1
    book.reserved = 2
    expect(book).to be_invalid
  end

  context "#reserve" do
    it "reduce reserved by 1 if still available" do
      book.quantity = 1
      book.reserved = 0
      book.save
      book.reserve
      book.reload
      expect(book.reserved).to eq 1
    end
  end

  context "#return" do
    it "increase reserved by 1 if still available" do
      book.reserved = 1
      book.save
      book.return
      book.reload
      expect(book.reserved).to eq 0
    end
  end
end

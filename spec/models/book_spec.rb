require 'rails_helper'

describe Book do
  let(:book) { build(:book) }

  it 'has a valid factory' do
    expect(book).to be_valid
  end

  it "invalid without name" do
    book.name = nil
    expect(book).to be_invalid
  end

  it "invalid without isbn" do
    book.isbn = nil
    expect(book).to be_invalid
  end

  it "invalid without quantity" do
    book.quantity = nil
    expect(book).to be_invalid
  end
end

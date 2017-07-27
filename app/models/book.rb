class Book < ActiveRecord::Base
  # Validations
  validates_presence_of :name, :isbn, :quantity
end

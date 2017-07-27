class Book < ActiveRecord::Base
  # Validations
  validates_presence_of :name, :isbn, :quantity
  validate :reserve_smaller_than_quantity

  # Callbacks
  before_validation :init_reserved

  def reserve
    self.reserved += 1
    save
  end

  def return
    self.reserved -= 1 if reserved > 0
    save
  end

  private

  def reserve_smaller_than_quantity
    return false unless reserved && quantity
    errors.add(:reserved, message: 'book is fully booked') if reserved > quantity
  end

  def init_reserved
    self.reserved = 0 if reserved.nil?
  end
end

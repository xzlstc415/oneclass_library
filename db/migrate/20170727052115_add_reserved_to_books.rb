class AddReservedToBooks < ActiveRecord::Migration
  def change
    add_column :books, :reserved, :integer
  end
end

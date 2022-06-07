class AddAddressToHikes < ActiveRecord::Migration[6.1]
  def change
    add_column :hikes, :address, :string
  end
end

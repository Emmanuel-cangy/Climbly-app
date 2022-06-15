class AddApprovedToHikes < ActiveRecord::Migration[6.1]
  def change
    add_column :hikes, :approved, :boolean, default: false
  end
end

class AddDescriptionToHikes < ActiveRecord::Migration[6.1]
  def change
    add_column :hikes, :description, :string
  end
end

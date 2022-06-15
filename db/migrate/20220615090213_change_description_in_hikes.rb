class ChangeDescriptionInHikes < ActiveRecord::Migration[6.1]
  def change
    change_column :hikes, :description, :text
  end
end

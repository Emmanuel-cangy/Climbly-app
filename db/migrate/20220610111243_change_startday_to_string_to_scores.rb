class ChangeStartdayToStringToScores < ActiveRecord::Migration[6.1]
  def change
    change_column :scores, :startDay, :string
  end
end

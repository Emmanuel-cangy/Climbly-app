class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.datetime :startDay
      t.datetime :endDay
      t.integer :duration
      t.references :hike, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

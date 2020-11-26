class CreateMealRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_records do |t|
      t.string :date, null: false
      t.string :meal_as, null: false
      t.string :content
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

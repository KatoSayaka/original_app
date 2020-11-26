class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.string :date,     null: false
      t.string :timezone, null: false
      t.integer :value,   null: false
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end

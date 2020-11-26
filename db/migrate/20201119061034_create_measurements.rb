class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.string :date
      t.string :timezone
      t.integer :value
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end

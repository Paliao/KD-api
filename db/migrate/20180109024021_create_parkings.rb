class CreateParkings < ActiveRecord::Migration[5.1]
  def change
    create_table :parkings do |t|
      t.integer :quantity
      t.time :open_hour
      t.time :closure_hour
      t.integer :hour_price
      t.references :establishment, foreign_key: true

      t.timestamps
    end
  end
end
class CreateParkings < ActiveRecord::Migration[5.1]
  def change
    create_table :parkings do |t|
      t.integer :quantity
      t.time :open_hour
      t.time :closure_hour
      t.integer :hour_price_cents
      t.boolean :free
      t.float :rating, default: 0.0
      t.integer :rating_count, default: 0
      t.belongs_to :establishment, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end

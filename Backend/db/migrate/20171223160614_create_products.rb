class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price_cents, default: 0
      t.string :description
      t.integer :quantity, default: 0
      t.float :rating, default: 0.0
      t.integer :rating_count, default: 0
      t.references :advertise, foreign_key: true
      t.references :category, foreign_key: true
      t.references :establishment, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end

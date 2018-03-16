class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.integer :price_cents, default: 0
      t.float :rating, default: 0.0
      t.integer :rating_count, default: 0
      t.references :category, foreign_key: true
      t.references :combo, foreign_key: true
      t.references :day, foreign_key: true
      t.references :establishment, foreign_key: true

      t.timestamps
    end
  end
end

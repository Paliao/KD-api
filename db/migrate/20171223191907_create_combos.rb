class CreateCombos < ActiveRecord::Migration[5.1]
  def change
    create_table :combos do |t|
      t.string :name
      t.integer :price
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

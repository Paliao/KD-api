class CreateCombos < ActiveRecord::Migration[5.1]
  def change
    create_table :combos do |t|
      t.string :name
      t.integer :price
      t.references :day, foreign_key: true
      t.references :establishment, foreign_key: true
      t.references :category, foreign_key: true      

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.string :category
      t.references :establishment, foreign_key: true
      t.references :combo, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end

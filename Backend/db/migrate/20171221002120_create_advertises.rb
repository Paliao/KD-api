class CreateAdvertises < ActiveRecord::Migration[5.1]
  def change
    create_table :advertises do |t|
      t.string :name
      t.integer :price_cents
      t.float :rating
      t.boolean :disponibility, default: true
      t.string :description
      t.float :rating, default: 0.0
      t.integer :rating_count, default: 0
      t.references :category, foreign_key: true      
      t.references :establishment, foreign_key: true

      t.timestamps
    end
  end
end

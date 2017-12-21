class CreateAdvertises < ActiveRecord::Migration[5.1]
  def change
    create_table :advertises do |t|
      t.string :name
      t.integer :price
      t.float :rating
      t.boolean :disponibility
      t.string :description
      t.references :establishment, foreign_key: true

      t.timestamps
    end
  end
end

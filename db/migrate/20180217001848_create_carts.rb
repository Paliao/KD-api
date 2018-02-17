class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.integer :price_aggregated
      t.integer :count
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

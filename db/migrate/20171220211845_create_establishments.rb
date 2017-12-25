class CreateEstablishments < ActiveRecord::Migration[5.1]
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :address
      t.integer :latitude
      t.integer :longitude
      t.float :rating, default: 0.0
      t.integer :rating_count, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

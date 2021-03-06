class CreateEstablishments < ActiveRecord::Migration[5.1]
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :street
      t.integer :number
      t.string :complement
      t.integer :latitude
      t.integer :longitude
      t.integer :area
      t.integer :capacity
      t.float :rating, default: 0.0
      t.integer :rating_count, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

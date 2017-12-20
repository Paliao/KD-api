class CreateEstablishments < ActiveRecord::Migration[5.1]
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :address
      t.integer :latitude
      t.integer :longitude
      t.float :rating

      t.timestamps
    end
  end
end

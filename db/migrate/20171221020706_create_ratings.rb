class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :avaliation
      t.string :description
      t.string :owner
      t.integer :owner_id
      t.references :advertise, foreign_key: true
      t.references :combo, foreign_key: true
      t.references :establishment, foreign_key: true
      t.references :event, foreign_key: true
      t.references :parking, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end

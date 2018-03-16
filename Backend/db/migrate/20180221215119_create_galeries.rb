class CreateGaleries < ActiveRecord::Migration[5.1]
  def change
    create_table :galeries do |t|
      t.string :url
      t.string :type
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

class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :avaliations
      t.references :advertise, foreign_key: true
      t.references :establishment, foreign_key: true

      t.timestamps
    end
  end
end

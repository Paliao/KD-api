class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.float :discount, default: 0
      t.float :fixed_value
      t.integer :per_users
      t.references :combo, foreign_key: true
      t.references :establishment, foreign_key: true
      t.references :events, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end

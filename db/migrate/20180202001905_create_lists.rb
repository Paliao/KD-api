class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.integer :current_value
      t.float :discount, default: 0
      t.datetime :opening
      t.datetime :expiration
      t.boolean :expired
      t.float :fixed_value
      t.integer :initial_value
      t.string :name
      t.integer :per_users
      t.references :establishment, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end

class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.string :day
      t.boolean :available
      t.time :available_hour
      t.time :unavailable_hour
      t.references :establishment, foreign_key: true
      t.references :product, foreign_key: true
      
      t.timestamps
    end
  end
end

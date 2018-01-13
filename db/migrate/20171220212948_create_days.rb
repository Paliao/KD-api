class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.string :name
      t.boolean :available, default: false
      t.datetime :available_hour
      t.datetime :unavailable_hour
      t.references :establishment, foreign_key: true
      
      t.timestamps
    end
  end
end

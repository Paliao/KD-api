class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.string :name
      t.boolean :available, default: false
      t.datetime :available_hour
      t.datetime :unavailable_hour
      
      t.timestamps
    end
  end
end

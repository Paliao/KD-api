class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.string :day
      t.boolean :oppened
      t.time :open_hour
      t.time :closure_hour
      t.boolean :special

      t.timestamps
    end
  end
end
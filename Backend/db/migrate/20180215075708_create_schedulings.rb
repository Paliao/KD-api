class CreateSchedulings < ActiveRecord::Migration[5.1]
  def change
    create_table :schedulings do |t|
      t.belongs_to :day, index: true
      t.belongs_to :establishment, index: true
      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :description
      t.references :establishment, foreign_key: true
      t.references :day, foreign_key: true

      t.timestamps
    end
  end
end

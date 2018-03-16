class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.integer :phone
      t.boolean :cellphone
      t.references :establishment, foreign_key: true      

      t.timestamps
    end
  end
end

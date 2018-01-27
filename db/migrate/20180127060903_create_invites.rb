class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.string :description
      t.boolean :accepted
      t.integer :from
      t.integer :to
      t.references :establishment, foreign_key: true

      t.timestamps
    end
  end
end

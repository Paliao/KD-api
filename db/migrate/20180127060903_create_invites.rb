class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.string :description
      t.boolean :accepted
      t.references :establishment, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.belongs_to :user, index: true
      t.belongs_to :establishment, index: true
      t.timestamps
    end
  end
end

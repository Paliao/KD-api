class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.belongs_to :day, index: true
      t.belongs_to :product, index: true
      t.timestamps
    end
  end
end

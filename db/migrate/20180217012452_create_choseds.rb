class CreateChoseds < ActiveRecord::Migration[5.1]
  def change
    create_table :choseds do |t|
      t.belongs_to :combo, index: true
      t.belongs_to :cart, index: true
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end

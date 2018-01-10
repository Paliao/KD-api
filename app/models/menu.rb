class Menu < ApplicationRecord
  # This model is a table to make all the has_many through relations
  # day-product; combo-product

  belongs_to :day, optional: true
  belongs_to :product
  belongs_to :combo, optional: true

end

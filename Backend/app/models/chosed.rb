class Chosed < ApplicationRecord
  # This model makes the many to many connection between:
  # Product - Cart
  # Combo - Cart
  belongs_to :cart
  belongs_to :combo, optional: true
  belongs_to :product, optional: true
end

class Parking < ApplicationRecord
  belongs_to :establishment

  validates :quantity, :open_hour, :closure_hour, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

class Parking < ApplicationRecord
  belongs_to :establishment

  validates :quantity, :open_hour, :closure_hour, :hour_price, presence: true
  validates :hour_price, numericality: { greater_than_or_equal_to: 0 }
end

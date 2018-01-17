class Parking < ApplicationRecord
  belongs_to :establishment

  validates :quantity, :open_hour, :closure_hour, :hour_price, presence: true
  validates :hour_price_cents, numericality: { greater_than_or_equal_to: 0 }

  monetize :hour_price_cents
end

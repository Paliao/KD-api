class Rating < ApplicationRecord
  belongs_to :advertise, optional: true
  belongs_to :product, optional: true
  belongs_to :combo, optional: true
  belongs_to :event, optional: true
  belongs_to :establishment

  validates :avaliation, numericality: {
    less_than_or_equal_to: 10, greater_than_or_equal_to: 0
  }
end

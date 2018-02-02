class List < ApplicationRecord
  belongs_to :combo, optional: true
  belongs_to :establishment
  belongs_to :events, optional: true
  belongs_to :product, optional: true

  validates :name, length: { minimum: 5, maximum: 30 }
  validates :per_user, numericality: { greater_than_or_equal_to: 0 }
end

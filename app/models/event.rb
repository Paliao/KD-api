class Event < ApplicationRecord
  belongs_to :category
  belongs_to :day
  belongs_to :establishment
  belongs_to :combo, optional: true

  has_many :ratings, dependent: :delete_all

  validates :name, length: { minimum: 10, maximum: 50 }
  validates :description, length: { minimum: 10, maximum: 500 }
  validates :price_cents, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating_count, numericality: { greater_than_or_equal_to: 0 }

  monetize :price_cents
end

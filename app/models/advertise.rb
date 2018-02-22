class Advertise < ApplicationRecord
  belongs_to :category
  belongs_to :establishment

  has_many :ratings, dependent: :delete_all
  has_many :products, dependent: :nullify
  has_many :combos, dependent: :nullify
  has_many :galeries, dependent: :delete_all

  validates :name, presence: true
  validates :description, length: { minimum: 10, maximum: 500 }
  validates :price_cents, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating_count, numericality: { greater_than_or_equal_to: 0 }

  monetize :price_cents
end

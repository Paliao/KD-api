class Advertise < ApplicationRecord
  belongs_to :establishment
  belongs_to :category

  has_many :ratings, dependent: :destroy

  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating_count, numericality: { greater_than_or_equal_to: 0 }
end

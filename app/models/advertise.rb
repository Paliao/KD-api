class Advertise < ApplicationRecord
  belongs_to :category
  belongs_to :establishment

  has_many :ratings, dependent: :destroy
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating_count, numericality: { greater_than_or_equal_to: 0 }
end

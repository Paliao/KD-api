class Combo < ApplicationRecord
  belongs_to :category
  belongs_to :day
  belongs_to :establishment

  has_many :events, dependent: :delete_all
  has_many :products, dependent: :delete_all

  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating_count, numericality: { greater_than_or_equal_to: 0 }
end

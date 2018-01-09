class Establishment < ApplicationRecord
  belongs_to :category

  has_many :advertises, dependent: :delete_all
  has_many :combos, dependent: :delete_all
  has_many :days, dependent: :delete_all
  has_many :events, dependent: :delete_all
  has_many :products, dependent: :delete_all
  has_many :ratings, dependent: :delete_all
  has_many :contacts, dependent: :delete_all

  validates :name, :street, :number, :capacity, :parking_lot, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating_count, numericality: { greater_than_or_equal_to: 0 }
end

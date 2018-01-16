class Combo < ApplicationRecord
  belongs_to :category
  belongs_to :day
  belongs_to :establishment
  belongs_to :advertise, optional: true

  has_many :events, dependent: :delete_all
  has_many :menus, dependent: :delete_all
  has_many :products, through: :menus, dependent: :nullify
  has_many :ratings, dependent: :delete_all

  validates :name, length: { minimum: 10, maximum: 50 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating_count, numericality: { greater_than_or_equal_to: 0 }
end

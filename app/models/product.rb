class Product < ApplicationRecord
  belongs_to :advertise, optional: true
  belongs_to :category
  belongs_to :establishment
  belongs_to :event, optional: true

  has_many :menus, dependent: :delete_all
  has_many :days, through: :menus, dependent: :nullify
  has_many :combos, through: :menus, dependent: :nullify
  has_many :ratings, dependent: :delete_all

  has_many :carts, through: :chosed, dependent: :nullify
  has_many :chosed, dependent: :delete_all

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :price_cents, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating_count, numericality: { greater_than_or_equal_to: 0 }

  monetize :price_cents
end

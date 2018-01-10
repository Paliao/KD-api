class Product < ApplicationRecord
  belongs_to :advertise, optional: true
  belongs_to :category
  belongs_to :combo, optional: true
  belongs_to :establishment
  belongs_to :event, optional: true

  has_many :menus, dependent: :delete_all
  has_many :days, through: :menus, dependent: :nullify

  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating_count, numericality: { greater_than_or_equal_to: 0 }
end

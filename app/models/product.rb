class Product < ApplicationRecord
  belongs_to :establishment1
  belongs_to :combo, optional: true
  belongs_to :event, optional: true

  has_many :days, dependent: :delete_all

  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

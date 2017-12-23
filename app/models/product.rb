class Product < ApplicationRecord
  after_initialize :init

  belongs_to :establishment
  belongs_to :combo, optional: true
  # belongs_to :event, optional: true

  has_many :days, dependent: :delete_all

  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  def init
    self.price ||= 0
    self.quantity ||= 0
  end
end

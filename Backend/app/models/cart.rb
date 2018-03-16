class Cart < ApplicationRecord
  has_many :chosed, dependent: :delete_all
  has_many :combos, through: :chosed, dependent: :nullify
  has_many :products, through: :chosed, dependent: :nullify

  validates :user_id, presence: true
  validates :count, numericality: { greater_than_or_equal_to: 0 }
  validates :total, numericality: { greater_than_or_equal_to: 0 }

  scope :onwer?, ->(user) { where(user_id: user) }
end

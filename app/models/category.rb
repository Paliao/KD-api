class Category < ApplicationRecord
  has_many :advertises, dependent: :delete_all
  has_many :combos, dependent: :delete_all
  has_many :establishments, dependent: :delete_all
  has_many :products, dependent: :delete_all
  has_many :events, dependent: :delete_all

  validates :description, :category_type, presence: true
end

class Category < ApplicationRecord
  has_many :advertises, dependent: :delete_all
  has_many :combos, dependent: :delete_all
  has_many :establishments, dependent: :delete_all
  has_many :events, dependent: :delete_all
  has_many :products, dependent: :delete_all

  validates :description, :name, presence: true
  validates :category_type, inclusion: {
    in: %w[Advertise Combo Establishment Events Products],
    message: '%<value>s is not a valid model'
  }
end

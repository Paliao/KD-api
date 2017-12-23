class Category < ApplicationRecord
  has_many :advertises, dependent: :delete_all
  has_many :combos, dependent: :delete_all
  has_many :establishments, dependent: :delete_all
  has_many :products, dependent: :delete_all
end

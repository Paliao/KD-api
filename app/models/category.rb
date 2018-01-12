class Category < ApplicationRecord
  has_many :advertises, dependent: :delete_all
  has_many :combos, dependent: :delete_all
  has_many :establishments, dependent: :delete_all
  has_many :events, dependent: :delete_all
  has_many :products, dependent: :delete_all

  validates :description, :name, presence: true
  validates :category_type, inclusion: {
    in: %w[advertise combo establishment event product],
    message: '%<value>s is not a valid model'
  }

  def self.category_checker(model, expected)
    category_id = model.category_id
    category = Category.find(category_id)
    return true if category.category_type == expected
    model.errors[:category] << ['This category is not for this type']
    false
  end
end

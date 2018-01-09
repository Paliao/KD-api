class Day < ApplicationRecord
  belongs_to :establishment
  belongs_to :product, optional: true

  has_many :combos, dependent: :delete_all
  has_many :events, dependent: :delete_all

  validates :name, :unavailable_hour, :available_hour, presence: true
end

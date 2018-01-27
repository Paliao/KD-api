class Establishment < ApplicationRecord
  belongs_to :category

  has_many :advertises, dependent: :delete_all
  has_many :combos, dependent: :delete_all
  has_many :contacts, dependent: :delete_all
  has_many :days, dependent: :delete_all
  has_many :events, dependent: :delete_all
  has_many :invites, dependent: :delete_all
  has_many :products, dependent: :delete_all
  has_many :ratings, dependent: :delete_all

  has_many :owners, dependent: :delete_all
  has_many :users, through: :owners, dependent: :nullify

  validates :name, :street, :number, presence: true
  validates :capacity, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating_count, numericality: { greater_than_or_equal_to: 0 }
end

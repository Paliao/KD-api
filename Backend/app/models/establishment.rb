class Establishment < ApplicationRecord
  belongs_to :category

  has_many :advertises, dependent: :delete_all
  has_many :combos, dependent: :delete_all
  has_many :contacts, dependent: :delete_all
  has_many :events, dependent: :delete_all
  has_many :galeries, dependent: :delete_all
  has_many :invites, dependent: :delete_all
  has_many :products, dependent: :delete_all
  has_many :ratings, dependent: :delete_all

  has_many :days, through: :schedulings, dependent: :nullify
  has_many :schedulings, dependent: :delete_all

  has_many :owners, dependent: :delete_all
  has_many :users, through: :owners, dependent: :nullify

  validates :name, :street, :number, presence: true
  validates :capacity, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating_count, numericality: { greater_than_or_equal_to: 0 }

  def self.already_in?(establishment, user_id)
    establishment.user_ids.exclude?(user_id)
  end

  def self.staff?(establishment_id, user)
    user_id = user.id
    establishment = Establishment.find(establishment_id)
    establishment.user_ids.include?(user_id)
  end
end

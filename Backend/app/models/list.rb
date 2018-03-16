class List < ApplicationRecord
  belongs_to :establishment
  belongs_to :event

  validates :name, length: { minimum: 5, maximum: 30 }
  validates :per_users, numericality: { greater_than_or_equal_to: 0 }
  validates :discount, numericality: { greater_than_or_equal_to: 0 }

  def self.valid_opening?(list, available_hour)
    list.opening < available_hour
  end

  def self.expired?(list, unavailable_hour)
    list.expiration > unavailable_hour
  end
end

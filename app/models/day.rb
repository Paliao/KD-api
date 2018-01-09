class Day < ApplicationRecord
  after_initialize :init

  belongs_to :establishment
  belongs_to :product, optional: true

  has_many :combos, dependent: :delete_all
  has_many :events, dependent: :delete_all

  validates :day, presence: true

  def init
    self.available_hour, self.unavailable_hour = nil unless available
  end
end

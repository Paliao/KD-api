class Day < ApplicationRecord
  after_initialize :init

  belongs_to :establishment
  belongs_to :product, optional: true

  has_many :combos, dependent: :delete_all
  has_many :events, dependent: :delete_all

  validates :day, inclusion: {
    in: %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday],
    message: '%<value>s is not a valid model'
  }

  def init
    self.available_hour, self.unavailable_hour = nil unless available
  end
end

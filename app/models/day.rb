class Day < ApplicationRecord
  after_initialize :init

  belongs_to :establishment

  has_many :combos, dependent: :nullify
  has_many :events, dependent: :delete_all
  has_many :menus, dependent: :delete_all
  has_many :products, through: :menus, dependent: :nullify

  validates :day, inclusion: {
    in: %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday],
    message: '%<value>s is not a valid model'
  }

  def init
    self.available_hour, self.unavailable_hour = nil unless available
  end
end

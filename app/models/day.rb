class Day < ApplicationRecord
  after_initialize :init

  has_many :combos, dependent: :nullify
  has_many :events, dependent: :delete_all
  has_many :menus, dependent: :delete_all
  has_many :products, through: :menus, dependent: :nullify

  has_many :establishments, through: :schedules, dependent: :nullify
  has_many :schedules, dependent: :delete_all

  validates :name, inclusion: {
    in: %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday],
    message: '%<value>s is not a valid model'
  }

  def init
    self.available_hour, self.unavailable_hour = nil unless available
  end
end

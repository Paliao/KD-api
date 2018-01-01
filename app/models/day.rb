class Day < ApplicationRecord
  belongs_to :establishment
  belongs_to :product, optional: true

  has_many :combos, dependent: :delete_all
  has_many :events, dependent: :delete_all

  after_initialize :init

  def init
    self.available ||= false
  end
end

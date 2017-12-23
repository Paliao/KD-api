class Day < ApplicationRecord
  belongs_to :establishment
  belongs_to :product, optional: true

  after_initialize :init

  def init
    self.available ||= false
  end
end

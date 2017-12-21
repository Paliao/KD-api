class Establishment < ApplicationRecord
  after_initialize :init

  has_many :days, dependent: :destroy
  has_many :advertises, dependent: :destroy
  has_many :ratings, dependent: :destroy

  def init
    self.rating_count ||= 0
  end
end

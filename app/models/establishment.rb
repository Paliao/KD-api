class Establishment < ApplicationRecord
  after_initialize :init
  attr_accessor :rating_count

  has_many :days, dependent: :destroy
  has_many :advertises, dependent: :destroy
  has_many :ratings, dependent: :destroy

  def init
    self.rating_count ||= 0
  end

  def rating_counter
    self.rating_count = self.ratings.size
  end
end

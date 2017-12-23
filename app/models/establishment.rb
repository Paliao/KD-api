class Establishment < ApplicationRecord
  after_initialize :init

  has_many :days, dependent: :delete_all
  has_many :advertises, dependent: :delete_all
  has_many :ratings, dependent: :delete_all
  has_many :products, dependent: :delete_all

  def init
    self.rating_count ||= 0
  end
end

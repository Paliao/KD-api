class Establishment < ApplicationRecord
  has_many :days
  has_many :advertises
end

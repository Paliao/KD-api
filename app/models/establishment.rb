class Establishment < ApplicationRecord
  has_many :days, dependent: :destroy
  has_many :advertises, dependent: :destroy
end

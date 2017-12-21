class Advertise < ApplicationRecord
  belongs_to :establishment
  has_many :advertises, dependent: :destroy
  has_many :ratings, dependent: :destroy
end

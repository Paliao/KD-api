class Advertise < ApplicationRecord
  belongs_to :establishment
  has_many :ratings, dependent: :destroy
end

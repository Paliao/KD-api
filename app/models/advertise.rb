class Advertise < ApplicationRecord
  belongs_to :establishment
  belongs_to :category

  has_many :ratings, dependent: :destroy
end

class Galery < ApplicationRecord
  belongs_to :advertise, optional: true
  belongs_to :combo, optional: true
  belongs_to :establishment
  belongs_to :event, optional: true
  belongs_to :parking, optional: true
  belongs_to :product, optional: true

  validates :url, :type, presence: true
end

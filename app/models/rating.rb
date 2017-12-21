class Rating < ApplicationRecord
  belongs_to :advertise, optional: true
  belongs_to :establishment
end

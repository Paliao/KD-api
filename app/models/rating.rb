class Rating < ApplicationRecord
  belongs_to :advertise
  belongs_to :establishment
end

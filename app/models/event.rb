class Event < ApplicationRecord
  belongs_to :establishment
  belongs_to :day
end

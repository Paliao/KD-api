class Event < ApplicationRecord
  belongs_to :category
  belongs_to :day
  belongs_to :establishment
end

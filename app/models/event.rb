class Event < ApplicationRecord
  belongs_to :category
  belongs_to :day
  belongs_to :establishment
  belongs_to :combo, optional: true
end

class Scheduling < ApplicationRecord
  # This model makes the many to many connection between:
  # Day - Establishment
  belongs_to :day
  belongs_to :establishment
end

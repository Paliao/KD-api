class List < ApplicationRecord
  belongs_to :combo
  belongs_to :establishment
  belongs_to :events
  belongs_to :product
end

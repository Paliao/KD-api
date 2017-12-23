class Product < ApplicationRecord
  belongs_to :establishment
  belongs_to :combo
  belongs_to :event
end

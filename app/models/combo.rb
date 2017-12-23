class Combo < ApplicationRecord
  belongs_to :establishment
  belongs_to :day

  has_many :products, dependent: :delete_all
  has_many :events, dependent: :delete_all
end

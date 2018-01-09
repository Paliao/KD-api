class Contact < ApplicationRecord
  belongs_to :establishment

  validates :phone, :cellphone, presence: true
end

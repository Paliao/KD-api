class Owner < ApplicationRecord
  # This model is a table to make all the has_many through relations
  # user-establishment

  belongs_to :user
  belongs_to :establishment

  scope :is_owner?, ->(owner) { where(user: owner) }
end

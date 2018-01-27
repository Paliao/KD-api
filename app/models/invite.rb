class Invite < ApplicationRecord
  belongs_to :establishment
  belongs_to :user

  scope :possible_invites, ->(establishment) { where(establishment: establishment) }
end

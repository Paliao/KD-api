class Invite < ApplicationRecord
  after_initialize :init

  belongs_to :establishment
  belongs_to :user

  scope :possible_invites, ->(establishment) { where(establishment: establishment) }
  scope :receiver?, ->(receiver) { where(user: receiver) }

  def init
    self.accepted = nil
  end
end

class Invite < ApplicationRecord
  after_initialize :init

  belongs_to :establishment
  belongs_to :user

  validates :invite_type, inclusion: {
    in: %w[STAFF FRIEND],
    message: '%<value>s is not a valid invite_type, only: STAFF or FRIEND will be accepted'
  }

  scope :possible_invites, ->(establishment) { where(establishment: establishment) }
  scope :receiver?, ->(receiver) { where(user: receiver) }

  def init
    self.accepted = nil
  end
end

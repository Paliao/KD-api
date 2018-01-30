class Invite < ApplicationRecord
  after_initialize :init

  belongs_to :establishment
  belongs_to :user

  validates :type, inclusion: {
    in: %w[STAFF FRIEND],
    message: '%<value>s is not a valid operation'
  }

  scope :possible_invites, ->(establishment) { where(establishment: establishment) }
  scope :receiver?, ->(receiver) { where(user: receiver) }

  def init
    self.accepted = nil
  end

  def self.alerady_in(establishment_id, user_id)
    establishment = Establishment.find(establishment_id)
    establishment.user_ids.exclude?(user_id)
  end
end

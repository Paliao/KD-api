class User < ApplicationRecord
  devise  :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable
  
  include DeviseTokenAuth::Concerns::User

  has_many :owners, dependent: :delete_all
  has_many :establishments, through: :owners, dependent: :nullify

end

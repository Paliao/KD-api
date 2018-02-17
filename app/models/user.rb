class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  include DeviseTokenAuth::Concerns::User

  has_many :owners, dependent: :delete_all
  has_many :establishments, through: :owners, dependent: :nullify

  has_one :cart, dependent: :delete
  has_many :ratings, dependent: :delete_all
end

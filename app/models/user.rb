class User < ApplicationRecord
  has_many :posts

  has_secure_password

  validates :email, presence: true, format: { with: /.@./ }
  validates :email, uniqueness: true
end

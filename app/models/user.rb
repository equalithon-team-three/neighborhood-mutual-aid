class User < ApplicationRecord
  has_many :posts
  has_many :assignments
end

class PostCategory < ApplicationRecord
  has_many :taggabilities
  has_many :tag_categories, through: :taggabilities
  has_many :posts
end

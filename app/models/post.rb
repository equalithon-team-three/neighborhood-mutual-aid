class Post < ApplicationRecord
  
  belongs_to :user
  belongs_to :post_category
  has_many :tag_categories, through: :post_category

  has_many :taggings
  has_many :tags, through: :taggings

  scope :uncompleted, -> { where(completed: false) }
  
end

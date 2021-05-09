class Post < ApplicationRecord
  validates :title, presence: true
  validates :details, presence: true

  belongs_to :user
  belongs_to :post_category
  has_many :tag_categories, through: :post_category

  has_many :taggings
  has_many :tags, through: :taggings

  def matching_posts
    post_category.posts.where.not(user_id: user_id).where.not(request_offer: request_offer)
  end

  scope :incomplete, -> { where(completed: false) }
end

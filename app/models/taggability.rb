class Taggability < ApplicationRecord
  belongs_to :post_category
  belongs_to :tag_category
end

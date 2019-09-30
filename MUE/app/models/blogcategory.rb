class Blogcategory < ApplicationRecord
  has_many :blogs, foreign_key: 'category_id'
  has_one_attached :image
end

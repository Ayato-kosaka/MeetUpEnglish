class Blogcategory < ApplicationRecord
  has_many :blogs, dependent: :nullify
  has_one_attached :image
end

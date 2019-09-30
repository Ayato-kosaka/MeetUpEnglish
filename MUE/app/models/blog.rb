class Blog < ApplicationRecord
  has_one_attached :image
  has_many :comments,class_name: 'Blogcomment', foreign_key: 'blogId',dependent: :destroy
  belongs_to :category, class_name: 'Blogcategory', foreign_key: 'category_id'
  validates :title, :text, presence: true #nil拒否
end

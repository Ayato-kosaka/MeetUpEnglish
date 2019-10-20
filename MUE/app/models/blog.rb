class Blog < ApplicationRecord
  has_one_attached :image
  has_many :comments,class_name: 'Blogcomment',dependent: :destroy
  has_many :sections,class_name: 'Section',dependent: :destroy
  belongs_to :category, class_name: 'Blogcategory'
  validates :title, :text, presence: true #nil拒否
end

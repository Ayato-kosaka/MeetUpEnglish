class Blog < ApplicationRecord
  has_one_attached :image
  has_many :comments,class_name: 'Blogcomment', foreign_key: 'blogId',dependent: :destroy
  validates :title, :text, presence: true #nil拒否
end

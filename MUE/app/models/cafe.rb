class Cafe < ApplicationRecord
  has_many :homes,class_name: 'Home', foreign_key: 'cafeId'
  has_many_attached :images
end

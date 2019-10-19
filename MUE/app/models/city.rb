class City < ApplicationRecord
  has_many_attached :images
  has_many :events
  belongs_to :prefecture
end

class City < ApplicationRecord
  has_many_attached :images
  belongs_to :prefecture
end

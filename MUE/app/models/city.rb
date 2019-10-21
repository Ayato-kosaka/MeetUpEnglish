class City < ApplicationRecord
  has_many_attached :images
  has_many :events, dependent: :destroy
  belongs_to :prefecture
end

class City < ApplicationRecord
  has_many_attached :images
  has_many :events, dependent: :destroy #it will be delietd
  has_many :places, dependent: :nullify
  belongs_to :prefecture
end

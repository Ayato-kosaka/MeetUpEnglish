class Cafe < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many_attached :images
end

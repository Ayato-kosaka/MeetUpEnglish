class Cafe < ApplicationRecord
  has_many :events
  has_many_attached :images
end

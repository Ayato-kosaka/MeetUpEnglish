class Place < ApplicationRecord
  has_many :teacher_places
  has_many :teachers, through: :teacher_places
  has_many :events, dependent: :destroy
  belongs_to :city

  validates :en_name, :ja_name, :placeId, :website, :latitude, :longitude, :city_id, presence: true

  reverse_geocoded_by :latitude, :longitude
  class << self
    def within_box(distance, latitude, longitude) #this method will find data with the argument
      distance = distance * 2 * 0.316 #マイルに変換
      center_point = [latitude, longitude]
      box = Geocoder::Calculations.bounding_box(center_point, distance)
      self.within_bounding_box(box)
    end
  end
end

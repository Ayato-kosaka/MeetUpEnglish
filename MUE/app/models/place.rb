class Place < ApplicationRecord
  has_many :teacher_places
  has_many :teachers, through: :teacher_places

  class << self
    def within_box(distance, latitude, longitude) #this method will find data with the argument
      distance = distance
      center_point = [latitude, longitude]
      box = Geocoder::Calculations.bounding_box(center_point, distance)
      self.within_bounding_box(box)
    end
  end
end

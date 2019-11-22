class Line < ApplicationRecord
  has_many :prefecture_lines
  has_many :prefectures, through: :prefecture_lines
  has_many :line_stations
  has_many :stations, through: :line_stations
end

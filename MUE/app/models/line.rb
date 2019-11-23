class Line < ApplicationRecord
  has_many :prefecture_lines
  has_many :prefectures, through: :prefecture_lines
  has_many :line_stations
  has_many :stations, through: :line_stations
end

__END__
t.string "name"
t.string "kana"
t.integer "cd"
t.datetime "created_at", null: false
t.datetime "updated_at", null: false

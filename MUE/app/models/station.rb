class Station < ApplicationRecord
  has_many :line_stations
  has_many :lines, through: :line_stations
end

__END__
t.string "name"
t.decimal "latitude", precision: 15, scale: 12
t.decimal "longitude", precision: 15, scale: 12
t.datetime "created_at", null: false
t.datetime "updated_at", null: false

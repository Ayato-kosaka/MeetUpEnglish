class Prefecture < ApplicationRecord
  # belongs_to :region
  has_many :cities, dependent: :destroy
  has_many :prefecture_lines
  has_many :lines, through: :prefecture_lines
end

__END__
t.string "name"
t.integer "region_id"
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.string "kana"

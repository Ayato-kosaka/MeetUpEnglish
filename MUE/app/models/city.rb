class City < ApplicationRecord
  has_many_attached :images
  has_many :events, dependent: :destroy #it will be delietd
  has_many :places, dependent: :nullify
  belongs_to :prefecture
end

__END__
t.string "name"
t.integer "prefecture_id"
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.string "kana"
t.string "double"

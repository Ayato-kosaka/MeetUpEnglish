class City < ApplicationRecord
  belongs_to :prefecture
  has_many :events, dependent: :destroy
  #for home page
  has_many :caves, dependent: :destroy
  has_many :teachers, dependent: :destroy, foreign_key: "city_id_id"
end

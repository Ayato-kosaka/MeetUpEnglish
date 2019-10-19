class Region < ApplicationRecord
  has_many :prefectures, dependent: :nullify
end

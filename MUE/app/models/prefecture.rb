class Prefecture < ApplicationRecord
  belongs_to :region
  has_many :cities, dependent: :nullify
end

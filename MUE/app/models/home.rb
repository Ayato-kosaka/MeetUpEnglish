class Home < ApplicationRecord
  has_many :contacts
  belongs_to :cafe, foreign_key: 'cafeId'
end

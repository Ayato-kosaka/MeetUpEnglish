class Home < ApplicationRecord
  has_many :contacts
  belongs_to :cafe, foreign_key: 'cafeId'


  def to_key
    [Base64.encode64(id.to_s)]
  end

  def to_param
    Base64.encode64(id.to_s)
  end
end

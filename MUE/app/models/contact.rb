class Contact < ApplicationRecord
  belongs_to :event, optional: true
  validates :name, :message, presence: true
end

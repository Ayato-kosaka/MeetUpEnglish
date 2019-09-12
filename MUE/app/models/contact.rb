class Contact < ApplicationRecord
  belongs_to :home, optional: true
  validates :name, :message, presence: true
end

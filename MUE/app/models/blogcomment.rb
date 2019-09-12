class Blogcomment < ApplicationRecord
  belongs_to :blog, foreign_key: 'blogId'
end

class TeacherPlace < ApplicationRecord
  belongs_to :teacher
  belongs_to :place
end

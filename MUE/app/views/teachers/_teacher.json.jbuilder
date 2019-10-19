json.extract! teacher, :id, :name, :gender, :selfIntroduction, :email, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)

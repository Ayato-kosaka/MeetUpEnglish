class Sessions::SignupController < ApplicationController
  skip_before_action :require_Admin
  layout 'simple'

  #signup_student_path 	GET 	/signup/student(.:format) 	sessions#signup_student
  def signup_student
  end
  #signup_student_path 	POST 	/signup/student(.:format) 	sessions#create_student
  def create_student
  end

  #signup_teacher_path 	GET 	/signup/teacher(.:format) 	sessions#signup_teacher
  def signup_teacher
  end
  #signup_teacher_path 	POST 	/signup/teacher(.:format) 	sessions#create_teacher
  def create_teacher
  end
end

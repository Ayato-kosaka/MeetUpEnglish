class SessionsController < ApplicationController
  skip_before_action :require_Admin
  layout 'simple'

  #login_path 	GET 	/login(.:format) 	sessions#new
  #login_path 	POST 	/login(.:format)  sessions#create
  def create
    log_out if logged_in?

		if (user = User.find_by(email: params[:session][:email].downcase)) && user.authenticate(params[:session][:password])
			log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
			redirect_to root_url
		else
  		flash.now[:alert] = '*emailかpasswordに誤りがあります'
  		render 'new'
    end
  end


  #login_teacher_path 	GET 	/login/teacher(.:format) sessions#teacher
  #login_teacher_path 	POST 	/login/teacher(.:format) sessions#signin_teacher
  def signin_teacher
    log_out if logged_in?

		if (user = Teacher.find_by(email: params[:session][:email].downcase)) && user.authenticate(params[:session][:password])
			log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
			redirect_to root_url
		else
  		flash.now[:alert] = '*emailかpasswordに誤りがあります'
  		render 'new'
    end
  end


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



  #logout_path 	DELETE 	/logout(.:format) 	sessions#destroy
  def destroy
    log_out if logged_in?
		redirect_to root_url
  end
end

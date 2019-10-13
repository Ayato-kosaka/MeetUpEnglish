class Sessions::LoginController < SessionsController

  #login_path 	GET 	/login(.:format) 	sessions/login#new
  #login_path 	POST 	/login(.:format)  sessions/login#create
  def create
    log_out if logged_in?

		if (user = User.find_by(email: params[:session][:email].downcase)) && user.authenticate(params[:session][:password])
			log_in(user, true)
      params[:session][:remember_me] == '1' ? remember(user,true) : forget(user)
			redirect_to root_url
		else
  		flash.now[:alert] = '*emailかpasswordに誤りがあります'
  		render 'new'
    end
  end


  #login_teacher_path 	GET 	/login/teacher(.:format) sessions/login#teacher
  #login_teacher_path 	POST 	/login/teacher(.:format) sessions/login#signin_teacher
  def signin_teacher
    log_out if logged_in?

		if (user = Teacher.find_by(email: params[:session][:email].downcase)) && user.authenticate(params[:session][:password])
			log_in(user, false)
      params[:session][:remember_me] == '1' ? remember(user,false) : forget(user)
			redirect_to teacher_account_index_url
		else
  		flash.now[:alert] = '*emailかpasswordに誤りがあります'
  		render 'teacher'
    end
  end
end

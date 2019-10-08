class Sessions::LoginController < SessionsController
  
  #login_path 	GET 	/login(.:format) 	sessions/login#new
  #login_path 	POST 	/login(.:format)  sessions/login#create
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


  #login_teacher_path 	GET 	/login/teacher(.:format) sessions/login#teacher
  #login_teacher_path 	POST 	/login/teacher(.:format) sessions/login#signin_teacher
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
end

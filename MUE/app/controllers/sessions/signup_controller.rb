class Sessions::SignupController < SessionsController

  #signup_student_path 	GET 	/signup/student(.:format) 	sessions/signup_student
  def signup_student
    @user = User.new
  end
  #signup_student_path 	POST 	/signup/student(.:format) 	sessions/create_student
  def create_student
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Meet up English!"
      redirect_to root_url
    else
      render :signup_student
    end
  end

  #signup_teacher_path 	GET 	/signup/teacher(.:format) 	sessions/signup_teacher
  def signup_teacher
  end
  #signup_teacher_path 	POST 	/signup/teacher(.:format) 	sessions/create_teacher
  def create_teacher
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :man, :email, :password, :password_confirmation)
    end
end

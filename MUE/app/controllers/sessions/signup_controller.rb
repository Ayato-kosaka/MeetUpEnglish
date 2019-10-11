class Sessions::SignupController < SessionsController

  #signup_student_path 	GET 	/signup/student(.:format) 	sessions/signup_student
  def signup_student
    @user = User.new
  end
  #signup_student_path 	POST 	/signup/student(.:format) 	sessions/create_student
  def create_student
    @user = User.new(user_params)
    if @user.save && params[:user][:gender]
      @user.update(gender: gender_convert_to_boolean)
      log_in @user
      flash[:success] = "Welcome to the Meet up English!"
      redirect_to root_url
    else
      @user.gender = gender_convert_to_boolean
      @gender_errors = "geneder is invalied" if !params[:user][:gender]
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
      params.require(:user).permit(:name, :gender, :email, :password, :password_confirmation)
    end

    def gender_convert_to_boolean #output true if there is no gender error
      if params[:user][:gender] == "男"
        return 1
      elsif params[:user][:gender] == "女"
        return 0
      end
    end
end

class WithErrorFormBuilder < ActionView::Helpers::FormBuilder

  def pick_errors(attribute)
    return nil if @object.nil? || (messages = @object.errors.messages[attribute]).nil?
    lis = messages.collect do |message|
      %{<li>#{@object.errors.full_message(attribute, message)}</li>}
    end.join

    %{<ul class="errors">#{lis}</ul>}.html_safe
  end

  def text_field(attribute, options={})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end

  def email_field(attribute, options={})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end

  def password_field(attribute, options={})
    return super if options[:no_errors]

    super + pick_errors(attribute)
  end
end

class TeacherController < ApplicationController
  before_action :require_login_as_teacher
  layout 'teacher'



  private

    def require_login_as_teacher
      unless session[:teacher]
        flash[:alert] = "You must be Teacher in to access this section"
        redirect_to login_teacher_url
      end
    end

end

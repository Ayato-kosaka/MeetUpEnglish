class TeacherController < ApplicationController
  skip_before_action :require_Admin
  before_action :require_login_as_teacher
  layout 'teacher'



  private

    def require_login_as_teacher
      redirect_to login_url if current_teacher.nil?
    end

end

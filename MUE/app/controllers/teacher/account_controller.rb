class Teacher::AccountController < TeacherController
  before_action :at_account

  def index

  end

  private
    def at_account
      @at = "account"
    end
end

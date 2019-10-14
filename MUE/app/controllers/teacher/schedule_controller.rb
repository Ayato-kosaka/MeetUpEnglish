class Teacher::ScheduleController < TeacherController
  before_action :at_schedule
  def index
  end


  private
    def at_schedule
      @at = "schedule"
    end
end

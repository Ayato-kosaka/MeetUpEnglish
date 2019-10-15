class Teacher::ScheduleController < TeacherController
  before_action :current_teacher
  before_action :at_schedule
  def index
  end

  def new
    @schedule = Home.new
    @events = @current_teacher.homes.where(date:  Date.parse(params[:date])).order(:start)
  end

  def create
    @schedule = @current_teacher.homes.new(home_params)
    @schedule.date = Date.parse(params[:date])

    logger.debug("-------------#{@schedule.inspect}----------")
    # if @blog.save
    #   redirect_to (@blog.youtube ? blogs_url : @blog)
    # else
      render :new
    # end
  end

  private
    def at_schedule
      @at = "schedule"
    end

    def home_params
      params.require(:home).permit(:cityId, :start, :end, :peopleNum, :teacherId, :cafeId)
    end
end

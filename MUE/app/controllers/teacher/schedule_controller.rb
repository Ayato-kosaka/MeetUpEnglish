class Teacher::ScheduleController < TeacherController
  before_action :current_teacher
  before_action :at_schedule
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  # teacher_schedule_index_path 	GET 	/teacher/schedule(.:format) 	teacher/schedule#index
  def index
  end

  # teacher_schedule_index_path 	POST 	/teacher/schedule(.:format) 	teacher/schedule#create
  def create
    @schedule = @current_teacher.homes.new(home_params)
    @schedule.date = Date.parse(params[:date])
    # if @blog.save
    #   redirect_to (@blog.youtube ? blogs_url : @blog)
    # else
      render :new
    # end
  end

  # new_teacher_schedule_path 	GET 	/teacher/schedule/new(.:format) 	teacher/schedule#new
  def new
    @schedule = Home.new
    @events = @current_teacher.homes.where(date:  Date.parse(params[:date])).order(:start)
  end

  # edit_teacher_schedule_path 	GET 	/teacher/schedule/:encoded_id/edit(.:format)   teacher/schedule#edit
  def edit

  end

  # teacher_schedule_path 	GET 	/teacher/schedule/:encoded_id(.:format) 	teacher/schedule#show
  def show

  end

  # teacher_schedule_path 	PATCH 	/teacher/schedule/:encoded_id(.:format)   teacher/schedule#update
  def update

  end

  private
    def set_home
      @schedule = Home.find(Base64.decode64(params[:encoded_id]))
    end

    def at_schedule
      @at = "schedule"
    end

    def home_params
      params.require(:home).permit(:cityId, :start, :end, :peopleNum, :teacherId, :cafeId)
    end
end

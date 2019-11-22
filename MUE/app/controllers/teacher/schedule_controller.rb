class Teacher::ScheduleController < TeacherController
  before_action :current_teacher
  before_action :at_schedule
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # teacher_schedule_index_path 	GET 	/teacher/schedule(.:format) 	teacher/schedule#index
  def index
    @events = @current_teacher.events
  end

  # teacher_schedule_index_path 	POST 	/teacher/schedule(.:format) 	teacher/schedule#create
  def create
    @new_event = @current_teacher.events.new(event_params)
    @new_event.date = Date.parse(params[:date])
    @events = @current_teacher.events.where(date:  params[:date]).order(:start)
    if @new_event.save
      redirect_to new_teacher_schedule_path(date: @new_event.date.strftime("%Y-%m-%d")), notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # new_teacher_schedule_path 	GET 	/teacher/schedule/new(.:format) 	teacher/schedule#new
  def new
    @new_event = Event.new
    @events = @current_teacher.events.where(date:  params[:date]).order(:start)
  end

  # edit_teacher_schedule_path 	GET 	/teacher/schedule/:encoded_id/edit(.:format)   teacher/schedule#edit
  def edit
    redirect_to teacher_schedule_path(params[:encoded_id]) if @event.user_events.count > 0
  end

  # teacher_schedule_path 	GET 	/teacher/schedule/:encoded_id(.:format) 	teacher/schedule#show
  def show
    @hour_num = ((@event.end-@event.start)/3600).to_i
  end

  # teacher_schedule_path 	PATCH 	/teacher/schedule/:encoded_id(.:format)   teacher/schedule#update
  def update
    if @event.update(event_params)
      redirect_to new_teacher_schedule_path(date: @event.date.strftime("%Y-%m-%d")), notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  #teacher_schedule_path DELETE 	/teacher/schedule/:encoded_id(.:format) 	teacher/schedule#destroy
  def destroy
    @event.destroy
    redirect_to new_teacher_schedule_path(date: @event.date.strftime("%Y-%m-%d")), notice: 'Event was successfully destroyed.'
  end

  private
    def set_event
      @event = @current_teacher.events.find(Base64.decode64(params[:encoded_id]))
    end

    def at_schedule
      @at = "schedule"
    end

    def event_params
      params.require(:event).permit(:title, :start, :end, :peopleNum, :fee, :place_id)
    end
end

class Teacher::OtherController < TeacherController
  before_action :current_teacher

  def newPlace
  end

  def createPlace
    human = {name: 'Tom', age: 20}
    render :json => human
  end
end

class Teacher::OtherController < TeacherController
  before_action :current_teacher

  def newPlace
  end

  def createPlace
  end

  def jaPlaceName
    logger.debug("-------------#{"sss"}----------")
    @flagment = true
    @english_place_name = params[:english_place_name]
  end
end

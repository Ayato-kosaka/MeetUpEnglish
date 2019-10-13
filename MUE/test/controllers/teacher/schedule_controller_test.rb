require 'test_helper'

class Teacher::ScheduleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teacher_schedule_index_url
    assert_response :success
  end

end

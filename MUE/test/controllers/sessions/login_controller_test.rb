require 'test_helper'

class Sessions::LoginControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get login" do
    get login_path
    assert_response :success
  end
end

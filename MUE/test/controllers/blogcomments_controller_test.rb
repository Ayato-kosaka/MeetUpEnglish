require 'test_helper'

class BlogcommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get blogcomments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get blogcomments_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get blogcomments_edit_url
    assert_response :success
  end

end

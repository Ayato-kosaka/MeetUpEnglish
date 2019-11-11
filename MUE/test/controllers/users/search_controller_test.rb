require 'test_helper'

class Users::SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_search_index_url
    assert_response :success
  end

  test "should get prefecture" do
    get users_search_prefecture_url
    assert_response :success
  end

  test "should get city" do
    get users_search_city_url
    assert_response :success
  end

end

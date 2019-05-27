require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get users_home_url
    assert_response :success
  end

  test "should get profile" do
    get users_profile_url
    assert_response :success
  end

  test "should get users_index" do
    get users_users_index_url
    assert_response :success
  end

end

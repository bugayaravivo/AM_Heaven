require "test_helper"

class Admin::SpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_spots_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_spots_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_spots_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_spots_edit_url
    assert_response :success
  end
end

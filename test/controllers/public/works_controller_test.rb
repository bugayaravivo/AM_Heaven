require "test_helper"

class Public::WorksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_works_index_url
    assert_response :success
  end

  test "should get show" do
    get public_works_show_url
    assert_response :success
  end
end

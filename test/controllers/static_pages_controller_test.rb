require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get landing_page" do
    get root_url
    assert_response :success
  end

  test "should get dashboard" do
    get dashboard_url
    assert_response :success
  end
end

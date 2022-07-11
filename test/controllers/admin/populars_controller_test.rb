require "test_helper"

class Admin::PopularsControllerTest < ActionDispatch::IntegrationTest
  test "should get popular" do
    get admin_populars_popular_url
    assert_response :success
  end
end

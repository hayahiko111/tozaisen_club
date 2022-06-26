require "test_helper"

class Public::StationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_stations_index_url
    assert_response :success
  end
end

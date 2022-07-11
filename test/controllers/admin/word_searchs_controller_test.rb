require "test_helper"

class Admin::WordSearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get word_search" do
    get admin_word_searchs_word_search_url
    assert_response :success
  end
end

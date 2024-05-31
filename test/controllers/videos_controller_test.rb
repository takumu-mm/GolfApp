require "test_helper"

class VideosControllerTest < ActionDispatch::IntegrationTest
  test "should get autocomplete" do
    get videos_autocomplete_url
    assert_response :success
  end
end

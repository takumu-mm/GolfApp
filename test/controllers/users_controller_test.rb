require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get autocomplete" do
    get users_autocomplete_url
    assert_response :success
  end
end

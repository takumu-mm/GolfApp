require "test_helper"

class SharedVideosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shared_videos_index_url
    assert_response :success
  end

  test "should get show" do
    get shared_videos_show_url
    assert_response :success
  end

  test "should get new" do
    get shared_videos_new_url
    assert_response :success
  end

  test "should get create" do
    get shared_videos_create_url
    assert_response :success
  end

  test "should get edit" do
    get shared_videos_edit_url
    assert_response :success
  end

  test "should get update" do
    get shared_videos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get shared_videos_destroy_url
    assert_response :success
  end
end

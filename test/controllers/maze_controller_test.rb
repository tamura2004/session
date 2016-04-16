require 'test_helper'

class MazeControllerTest < ActionController::TestCase
  test "should get top" do
    get :top
    assert_response :success
  end

  test "should get up" do
    get :up
    assert_response :success
  end

  test "should get down" do
    get :down
    assert_response :success
  end

end

require 'test_helper'

class DungeonControllerTest < ActionController::TestCase
  test "should get up" do
    get :up
    assert_response :success
  end

  test "should get down" do
    get :down
    assert_response :success
  end

end

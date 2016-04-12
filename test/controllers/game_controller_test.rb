require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get start" do
    get :start
    assert_response :success
  end

  test "should get over" do
    get :over
    assert_response :success
  end

end

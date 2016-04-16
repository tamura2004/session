require 'test_helper'

class MenuControllerTest < ActionController::TestCase
  test "should get top" do
    get :top
    assert_response :success
  end

  test "should get tavern" do
    get :tavern
    assert_response :success
  end

  test "should get inn" do
    get :inn
    assert_response :success
  end

  test "should get trade" do
    get :trade
    assert_response :success
  end

  test "should get temple" do
    get :temple
    assert_response :success
  end

  test "should get edge" do
    get :edge
    assert_response :success
  end

end

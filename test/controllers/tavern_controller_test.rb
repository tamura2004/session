require 'test_helper'

class TavernControllerTest < ActionController::TestCase
  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get remove" do
    get :remove
    assert_response :success
  end

  test "should get stat" do
    get :stat
    assert_response :success
  end

  test "should get share" do
    get :share
    assert_response :success
  end

  test "should get exit" do
    get :exit
    assert_response :success
  end

end

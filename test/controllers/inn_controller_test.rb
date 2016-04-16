require 'test_helper'

class InnControllerTest < ActionController::TestCase
  test "should get select" do
    get :select
    assert_response :success
  end

  test "should get horse" do
    get :horse
    assert_response :success
  end

  test "should get simple" do
    get :simple
    assert_response :success
  end

  test "should get economy" do
    get :economy
    assert_response :success
  end

  test "should get sweet" do
    get :sweet
    assert_response :success
  end

  test "should get royal" do
    get :royal
    assert_response :success
  end

end

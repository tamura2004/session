require 'test_helper'

class TradeControllerTest < ActionController::TestCase
  test "should get buy" do
    get :buy
    assert_response :success
  end

  test "should get sell" do
    get :sell
    assert_response :success
  end

  test "should get dispel" do
    get :dispel
    assert_response :success
  end

  test "should get identify" do
    get :identify
    assert_response :success
  end

  test "should get gold" do
    get :gold
    assert_response :success
  end

end

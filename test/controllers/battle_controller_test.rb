require 'test_helper'

class BattleControllerTest < ActionController::TestCase
  test "should get weapon" do
    get :weapon
    assert_response :success
  end

  test "should get spell" do
    get :spell
    assert_response :success
  end

  test "should get item" do
    get :item
    assert_response :success
  end

  test "should get defence" do
    get :defence
    assert_response :success
  end

  test "should get escape" do
    get :escape
    assert_response :success
  end

end

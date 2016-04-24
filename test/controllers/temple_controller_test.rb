require 'test_helper'

class TempleControllerTest < ActionController::TestCase
  test "should get raise_dead" do
    get :raise_dead
    assert_response :success
  end

  test "should get reserrection" do
    get :reserrection
    assert_response :success
  end

  test "should get cure_paralysis" do
    get :cure_paralysis
    assert_response :success
  end

  test "should get neutralize_poison" do
    get :neutralize_poison
    assert_response :success
  end

  test "should get remove_curse" do
    get :remove_curse
    assert_response :success
  end

  test "should get turn_to_fresh" do
    get :turn_to_fresh
    assert_response :success
  end

end

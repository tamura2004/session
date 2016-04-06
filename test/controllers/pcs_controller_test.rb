require 'test_helper'

class PcsControllerTest < ActionController::TestCase
  setup do
    @pc = pcs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pc" do
    assert_difference('Pc.count') do
      post :create, pc: { name: @pc.name }
    end

    assert_redirected_to pc_path(assigns(:pc))
  end

  test "should show pc" do
    get :show, id: @pc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pc
    assert_response :success
  end

  test "should update pc" do
    patch :update, id: @pc, pc: { name: @pc.name }
    assert_redirected_to pc_path(assigns(:pc))
  end

  test "should destroy pc" do
    assert_difference('Pc.count', -1) do
      delete :destroy, id: @pc
    end

    assert_redirected_to pcs_path
  end
end

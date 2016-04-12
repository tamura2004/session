require 'test_helper'

class ScinariosControllerTest < ActionController::TestCase
  setup do
    @scinario = scinarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scinarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scinario" do
    assert_difference('Scinario.count') do
      post :create, scinario: { name: @scinario.name }
    end

    assert_redirected_to scinario_path(assigns(:scinario))
  end

  test "should show scinario" do
    get :show, id: @scinario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scinario
    assert_response :success
  end

  test "should update scinario" do
    patch :update, id: @scinario, scinario: { name: @scinario.name }
    assert_redirected_to scinario_path(assigns(:scinario))
  end

  test "should destroy scinario" do
    assert_difference('Scinario.count', -1) do
      delete :destroy, id: @scinario
    end

    assert_redirected_to scinarios_path
  end
end

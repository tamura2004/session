require 'test_helper'

class PcSkillsControllerTest < ActionController::TestCase
  setup do
    @pc_skill = pc_skills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pc_skills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pc_skill" do
    assert_difference('PcSkill.count') do
      post :create, pc_skill: {  }
    end

    assert_redirected_to pc_skill_path(assigns(:pc_skill))
  end

  test "should show pc_skill" do
    get :show, id: @pc_skill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pc_skill
    assert_response :success
  end

  test "should update pc_skill" do
    patch :update, id: @pc_skill, pc_skill: {  }
    assert_redirected_to pc_skill_path(assigns(:pc_skill))
  end

  test "should destroy pc_skill" do
    assert_difference('PcSkill.count', -1) do
      delete :destroy, id: @pc_skill
    end

    assert_redirected_to pc_skills_path
  end
end

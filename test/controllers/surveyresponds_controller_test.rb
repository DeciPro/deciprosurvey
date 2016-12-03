require 'test_helper'

class SurveyrespondsControllerTest < ActionController::TestCase
  setup do
    @surveyrespond = surveyresponds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:surveyresponds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create surveyrespond" do
    assert_difference('Surveyrespond.count') do
      post :create, surveyrespond: { alignment: @surveyrespond.alignment, arepros: @surveyrespond.arepros, areyou: @surveyrespond.areyou, cheaper: @surveyrespond.cheaper, discre: @surveyrespond.discre, faster: @surveyrespond.faster, info1: @surveyrespond.info1, info2: @surveyrespond.info2, remote: @surveyrespond.remote, transparent: @surveyrespond.transparent }
    end

    assert_redirected_to surveyrespond_path(assigns(:surveyrespond))
  end

  test "should show surveyrespond" do
    get :show, id: @surveyrespond
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @surveyrespond
    assert_response :success
  end

  test "should update surveyrespond" do
    patch :update, id: @surveyrespond, surveyrespond: { alignment: @surveyrespond.alignment, arepros: @surveyrespond.arepros, areyou: @surveyrespond.areyou, cheaper: @surveyrespond.cheaper, discre: @surveyrespond.discre, faster: @surveyrespond.faster, info1: @surveyrespond.info1, info2: @surveyrespond.info2, remote: @surveyrespond.remote, transparent: @surveyrespond.transparent }
    assert_redirected_to surveyrespond_path(assigns(:surveyrespond))
  end

  test "should destroy surveyrespond" do
    assert_difference('Surveyrespond.count', -1) do
      delete :destroy, id: @surveyrespond
    end

    assert_redirected_to surveyresponds_path
  end
end

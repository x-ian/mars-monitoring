require 'test_helper'

class UserServiceClassificationsControllerTest < ActionController::TestCase
  setup do
    @user_service_classification = user_service_classifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_service_classifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_service_classification" do
    assert_difference('UserServiceClassification.count') do
      post :create, user_service_classification: { service_classification_id: @user_service_classification.service_classification_id, user_id: @user_service_classification.user_id }
    end

    assert_redirected_to user_service_classification_path(assigns(:user_service_classification))
  end

  test "should show user_service_classification" do
    get :show, id: @user_service_classification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_service_classification
    assert_response :success
  end

  test "should update user_service_classification" do
    put :update, id: @user_service_classification, user_service_classification: { service_classification_id: @user_service_classification.service_classification_id, user_id: @user_service_classification.user_id }
    assert_redirected_to user_service_classification_path(assigns(:user_service_classification))
  end

  test "should destroy user_service_classification" do
    assert_difference('UserServiceClassification.count', -1) do
      delete :destroy, id: @user_service_classification
    end

    assert_redirected_to user_service_classifications_path
  end
end

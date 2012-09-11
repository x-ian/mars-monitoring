require 'test_helper'

class ServiceClassificationsControllerTest < ActionController::TestCase
  setup do
    @service_classification = service_classifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_classifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_classification" do
    assert_difference('ServiceClassification.count') do
      post :create, service_classification: { name: @service_classification.name, parent_service_classification: @service_classification.parent_service_classification }
    end

    assert_redirected_to service_classification_path(assigns(:service_classification))
  end

  test "should show service_classification" do
    get :show, id: @service_classification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_classification
    assert_response :success
  end

  test "should update service_classification" do
    put :update, id: @service_classification, service_classification: { name: @service_classification.name, parent_service_classification: @service_classification.parent_service_classification }
    assert_redirected_to service_classification_path(assigns(:service_classification))
  end

  test "should destroy service_classification" do
    assert_difference('ServiceClassification.count', -1) do
      delete :destroy, id: @service_classification
    end

    assert_redirected_to service_classifications_path
  end
end

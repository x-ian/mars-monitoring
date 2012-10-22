require 'test_helper'

class ValueTypesControllerTest < ActionController::TestCase
  setup do
    @value_type = value_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:value_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create value_type" do
    assert_difference('ValueType.count') do
      post :create, value_type: { description: @value_type.description, name: @value_type.name }
    end

    assert_redirected_to value_type_path(assigns(:value_type))
  end

  test "should show value_type" do
    get :show, id: @value_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @value_type
    assert_response :success
  end

  test "should update value_type" do
    put :update, id: @value_type, value_type: { description: @value_type.description, name: @value_type.name }
    assert_redirected_to value_type_path(assigns(:value_type))
  end

  test "should destroy value_type" do
    assert_difference('ValueType.count', -1) do
      delete :destroy, id: @value_type
    end

    assert_redirected_to value_types_path
  end
end

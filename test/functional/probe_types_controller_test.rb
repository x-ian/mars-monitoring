require 'test_helper'

class ProbeTypesControllerTest < ActionController::TestCase
  setup do
    @probe_type = probe_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:probe_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create probe_type" do
    assert_difference('ProbeType.count') do
      post :create, probe_type: { description: @probe_type.description, name: @probe_type.name, communication_channel_id: @probe_type.communication_channel_id }
    end

    assert_redirected_to probe_type_path(assigns(:probe_type))
  end

  test "should show probe_type" do
    get :show, id: @probe_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @probe_type
    assert_response :success
  end

  test "should update probe_type" do
    put :update, id: @probe_type, probe_type: { description: @probe_type.description, name: @probe_type.name, communication_channel_id: @probe_type.communication_channel_id }
    assert_redirected_to probe_type_path(assigns(:probe_type))
  end

  test "should destroy probe_type" do
    assert_difference('ProbeType.count', -1) do
      delete :destroy, id: @probe_type
    end

    assert_redirected_to probe_types_path
  end
end

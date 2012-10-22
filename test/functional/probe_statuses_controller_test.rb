require 'test_helper'

class ProbeStatusesControllerTest < ActionController::TestCase
  setup do
    @probe_status = probe_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:probe_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create probe_status" do
    assert_difference('ProbeStatus.count') do
      post :create, probe_status: { assumed: @probe_status.assumed, name: @probe_status.name, status: @probe_status.status }
    end

    assert_redirected_to probe_status_path(assigns(:probe_status))
  end

  test "should show probe_status" do
    get :show, id: @probe_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @probe_status
    assert_response :success
  end

  test "should update probe_status" do
    put :update, id: @probe_status, probe_status: { assumed: @probe_status.assumed, name: @probe_status.name, status: @probe_status.status }
    assert_redirected_to probe_status_path(assigns(:probe_status))
  end

  test "should destroy probe_status" do
    assert_difference('ProbeStatus.count', -1) do
      delete :destroy, id: @probe_status
    end

    assert_redirected_to probe_statuses_path
  end
end

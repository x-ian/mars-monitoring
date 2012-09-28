require 'test_helper'

class ProbesProbeStatusConfigrationsControllerTest < ActionController::TestCase
  setup do
    @probes_probe_status_configration = probes_probe_status_configrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:probes_probe_status_configrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create probes_probe_status_configration" do
    assert_difference('ProbesProbeStatusConfigration.count') do
      post :create, probes_probe_status_configration: { probe_id: @probes_probe_status_configration.probe_id, probe_status_configuration_id: @probes_probe_status_configration.probe_status_configuration_id }
    end

    assert_redirected_to probes_probe_status_configration_path(assigns(:probes_probe_status_configration))
  end

  test "should show probes_probe_status_configration" do
    get :show, id: @probes_probe_status_configration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @probes_probe_status_configration
    assert_response :success
  end

  test "should update probes_probe_status_configration" do
    put :update, id: @probes_probe_status_configration, probes_probe_status_configration: { probe_id: @probes_probe_status_configration.probe_id, probe_status_configuration_id: @probes_probe_status_configration.probe_status_configuration_id }
    assert_redirected_to probes_probe_status_configration_path(assigns(:probes_probe_status_configration))
  end

  test "should destroy probes_probe_status_configration" do
    assert_difference('ProbesProbeStatusConfigration.count', -1) do
      delete :destroy, id: @probes_probe_status_configration
    end

    assert_redirected_to probes_probe_status_configrations_path
  end
end

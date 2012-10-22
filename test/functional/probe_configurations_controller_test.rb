require 'test_helper'

class ProbeConfigurationsControllerTest < ActionController::TestCase
  setup do
    @probe_configuration = probe_configurations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:probe_configurations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create probe_configuration" do
    assert_difference('ProbeConfiguration.count') do
      post :create, probe_configuration: { alarm_interval: @probe_configuration.alarm_interval, ane: @probe_configuration.ane, heartbeat_interval: @probe_configuration.heartbeat_interval, rule_assumed: @probe_configuration.rule_assumed, rule_error: @probe_configuration.rule_error, rule_ok: @probe_configuration.rule_ok, rule_warning: @probe_configuration.rule_warning, value1_threshold: @probe_configuration.value1_threshold, value1_type_id: @probe_configuration.value1_type_id, value2_threshold: @probe_configuration.value2_threshold, value2_type_id: @probe_configuration.value2_type_id, value3_threshold: @probe_configuration.value3_threshold, value3_type_id: @probe_configuration.value3_type_id, value4_threshold: @probe_configuration.value4_threshold, value4_type_id: @probe_configuration.value4_type_id }
    end

    assert_redirected_to probe_configuration_path(assigns(:probe_configuration))
  end

  test "should show probe_configuration" do
    get :show, id: @probe_configuration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @probe_configuration
    assert_response :success
  end

  test "should update probe_configuration" do
    put :update, id: @probe_configuration, probe_configuration: { alarm_interval: @probe_configuration.alarm_interval, ane: @probe_configuration.ane, heartbeat_interval: @probe_configuration.heartbeat_interval, rule_assumed: @probe_configuration.rule_assumed, rule_error: @probe_configuration.rule_error, rule_ok: @probe_configuration.rule_ok, rule_warning: @probe_configuration.rule_warning, value1_threshold: @probe_configuration.value1_threshold, value1_type_id: @probe_configuration.value1_type_id, value2_threshold: @probe_configuration.value2_threshold, value2_type_id: @probe_configuration.value2_type_id, value3_threshold: @probe_configuration.value3_threshold, value3_type_id: @probe_configuration.value3_type_id, value4_threshold: @probe_configuration.value4_threshold, value4_type_id: @probe_configuration.value4_type_id }
    assert_redirected_to probe_configuration_path(assigns(:probe_configuration))
  end

  test "should destroy probe_configuration" do
    assert_difference('ProbeConfiguration.count', -1) do
      delete :destroy, id: @probe_configuration
    end

    assert_redirected_to probe_configurations_path
  end
end

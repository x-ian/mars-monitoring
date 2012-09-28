require 'test_helper'

class ProbeStatusConfigurationsControllerTest < ActionController::TestCase
  setup do
    @probe_status_configuration = probe_status_configurations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:probe_status_configurations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create probe_status_configuration" do
    assert_difference('ProbeStatusConfiguration.count') do
      post :create, probe_status_configuration: { assumed: @probe_status_configuration.assumed, probe_id: @probe_status_configuration.probe_id, probe_status_template_id: @probe_status_configuration.probe_status_template_id, rule_error: @probe_status_configuration.rule_error, rule_ok: @probe_status_configuration.rule_ok, rule_warning: @probe_status_configuration.rule_warning, user_id: @probe_status_configuration.user_id }
    end

    assert_redirected_to probe_status_configuration_path(assigns(:probe_status_configuration))
  end

  test "should show probe_status_configuration" do
    get :show, id: @probe_status_configuration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @probe_status_configuration
    assert_response :success
  end

  test "should update probe_status_configuration" do
    put :update, id: @probe_status_configuration, probe_status_configuration: { assumed: @probe_status_configuration.assumed, probe_id: @probe_status_configuration.probe_id, probe_status_template_id: @probe_status_configuration.probe_status_template_id, rule_error: @probe_status_configuration.rule_error, rule_ok: @probe_status_configuration.rule_ok, rule_warning: @probe_status_configuration.rule_warning, user_id: @probe_status_configuration.user_id }
    assert_redirected_to probe_status_configuration_path(assigns(:probe_status_configuration))
  end

  test "should destroy probe_status_configuration" do
    assert_difference('ProbeStatusConfiguration.count', -1) do
      delete :destroy, id: @probe_status_configuration
    end

    assert_redirected_to probe_status_configurations_path
  end
end

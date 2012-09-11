require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, message: { device_time: @message.device_time, device_uptime: @message.device_uptime, message_type_id: @message.message_type_id, outgoing_message_count: @message.outgoing_message_count, probe_id: @message.probe_id, restart_count: @message.restart_count, server_time: @message.server_time, value1: @message.value1, value2: @message.value2, value3: @message.value3, value4: @message.value4 }
    end

    assert_redirected_to message_path(assigns(:message))
  end

  test "should show message" do
    get :show, id: @message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message
    assert_response :success
  end

  test "should update message" do
    put :update, id: @message, message: { device_time: @message.device_time, device_uptime: @message.device_uptime, message_type_id: @message.message_type_id, outgoing_message_count: @message.outgoing_message_count, probe_id: @message.probe_id, restart_count: @message.restart_count, server_time: @message.server_time, value1: @message.value1, value2: @message.value2, value3: @message.value3, value4: @message.value4 }
    assert_redirected_to message_path(assigns(:message))
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete :destroy, id: @message
    end

    assert_redirected_to messages_path
  end
end

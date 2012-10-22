require 'test_helper'

class CommunicationChannelsControllerTest < ActionController::TestCase
  setup do
    @communication_channel = communication_channels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:communication_channels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create communication_channel" do
    assert_difference('CommunicationChannel.count') do
      post :create, communication_channel: { name: @communication_channel.name }
    end

    assert_redirected_to communication_channel_path(assigns(:communication_channel))
  end

  test "should show communication_channel" do
    get :show, id: @communication_channel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @communication_channel
    assert_response :success
  end

  test "should update communication_channel" do
    put :update, id: @communication_channel, communication_channel: { name: @communication_channel.name }
    assert_redirected_to communication_channel_path(assigns(:communication_channel))
  end

  test "should destroy communication_channel" do
    assert_difference('CommunicationChannel.count', -1) do
      delete :destroy, id: @communication_channel
    end

    assert_redirected_to communication_channels_path
  end
end

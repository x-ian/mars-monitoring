require 'test_helper'

class InvalidMessagesControllerTest < ActionController::TestCase
  setup do
    @invalid_message = invalid_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invalid_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invalid_message" do
    assert_difference('InvalidMessage.count') do
      post :create, invalid_message: { content: @invalid_message.content }
    end

    assert_redirected_to invalid_message_path(assigns(:invalid_message))
  end

  test "should show invalid_message" do
    get :show, id: @invalid_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invalid_message
    assert_response :success
  end

  test "should update invalid_message" do
    put :update, id: @invalid_message, invalid_message: { content: @invalid_message.content }
    assert_redirected_to invalid_message_path(assigns(:invalid_message))
  end

  test "should destroy invalid_message" do
    assert_difference('InvalidMessage.count', -1) do
      delete :destroy, id: @invalid_message
    end

    assert_redirected_to invalid_messages_path
  end
end

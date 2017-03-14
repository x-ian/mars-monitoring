require 'test_helper'

class NotificationReasonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notification_reason = notification_reasons(:one)
  end

  test "should get index" do
    get notification_reasons_url
    assert_response :success
  end

  test "should get new" do
    get new_notification_reason_url
    assert_response :success
  end

  test "should create notification_reason" do
    assert_difference('NotificationReason.count') do
      post notification_reasons_url, params: { notification_reason: { name: @notification_reason.name } }
    end

    assert_redirected_to notification_reason_url(NotificationReason.last)
  end

  test "should show notification_reason" do
    get notification_reason_url(@notification_reason)
    assert_response :success
  end

  test "should get edit" do
    get edit_notification_reason_url(@notification_reason)
    assert_response :success
  end

  test "should update notification_reason" do
    patch notification_reason_url(@notification_reason), params: { notification_reason: { name: @notification_reason.name } }
    assert_redirected_to notification_reason_url(@notification_reason)
  end

  test "should destroy notification_reason" do
    assert_difference('NotificationReason.count', -1) do
      delete notification_reason_url(@notification_reason)
    end

    assert_redirected_to notification_reasons_url
  end
end

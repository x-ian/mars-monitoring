require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  setup do
    @subscription = subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subscription" do
    assert_difference('Subscription.count') do
      post :create, subscription: { name: @subscription.name, subscriber1_id: @subscription.subscriber1_id, subscriber2_id: @subscription.subscriber2_id, subscriber3_id: @subscription.subscriber3_id, subscriber4_id: @subscription.subscriber4_id, subscriber5_id: @subscription.subscriber5_id }
    end

    assert_redirected_to subscription_path(assigns(:subscription))
  end

  test "should show subscription" do
    get :show, id: @subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subscription
    assert_response :success
  end

  test "should update subscription" do
    put :update, id: @subscription, subscription: { name: @subscription.name, subscriber1_id: @subscription.subscriber1_id, subscriber2_id: @subscription.subscriber2_id, subscriber3_id: @subscription.subscriber3_id, subscriber4_id: @subscription.subscriber4_id, subscriber5_id: @subscription.subscriber5_id }
    assert_redirected_to subscription_path(assigns(:subscription))
  end

  test "should destroy subscription" do
    assert_difference('Subscription.count', -1) do
      delete :destroy, id: @subscription
    end

    assert_redirected_to subscriptions_path
  end
end

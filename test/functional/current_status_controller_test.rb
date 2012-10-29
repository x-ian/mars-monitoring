require 'test_helper'

class CurrentStatusControllerTest < ActionController::TestCase
  test "should get aggregation" do
    get :aggregation
    assert_response :success
  end

  test "should get by_location" do
    get :by_location
    assert_response :success
  end

  test "should get by_probe_type" do
    get :by_probe_type
    assert_response :success
  end

  test "should get by_location_probe_type" do
    get :by_location_probe_type
    assert_response :success
  end

end

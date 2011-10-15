require 'test_helper'

class TrackingShipmentsControllerTest < ActionController::TestCase
  setup do
    @tracking_shipment = tracking_shipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tracking_shipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tracking_shipment" do
    assert_difference('TrackingShipment.count') do
      post :create, :tracking_shipment => @tracking_shipment.attributes
    end

    assert_redirected_to tracking_shipment_path(assigns(:tracking_shipment))
  end

  test "should show tracking_shipment" do
    get :show, :id => @tracking_shipment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tracking_shipment.to_param
    assert_response :success
  end

  test "should update tracking_shipment" do
    put :update, :id => @tracking_shipment.to_param, :tracking_shipment => @tracking_shipment.attributes
    assert_redirected_to tracking_shipment_path(assigns(:tracking_shipment))
  end

  test "should destroy tracking_shipment" do
    assert_difference('TrackingShipment.count', -1) do
      delete :destroy, :id => @tracking_shipment.to_param
    end

    assert_redirected_to tracking_shipments_path
  end
end

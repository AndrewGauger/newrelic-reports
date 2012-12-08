require 'test_helper'

class NewrelicsControllerTest < ActionController::TestCase
  setup do
    @newrelic = newrelics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newrelics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newrelic" do
    assert_difference('Newrelic.count') do
      post :create, newrelic: { account_id: @newrelic.account_id, api_key: @newrelic.api_key, app_id: @newrelic.app_id }
    end

    assert_redirected_to newrelic_path(assigns(:newrelic))
  end

  test "should show newrelic" do
    get :show, id: @newrelic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @newrelic
    assert_response :success
  end

  test "should update newrelic" do
    put :update, id: @newrelic, newrelic: { account_id: @newrelic.account_id, api_key: @newrelic.api_key, app_id: @newrelic.app_id }
    assert_redirected_to newrelic_path(assigns(:newrelic))
  end

  test "should destroy newrelic" do
    assert_difference('Newrelic.count', -1) do
      delete :destroy, id: @newrelic
    end

    assert_redirected_to newrelics_path
  end
end

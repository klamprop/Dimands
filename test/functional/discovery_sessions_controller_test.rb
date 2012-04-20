require 'test_helper'

class DiscoverySessionsControllerTest < ActionController::TestCase
  setup do
    @discovery_session = discovery_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discovery_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discovery_session" do
    assert_difference('DiscoverySession.count') do
      post :create, discovery_session: @discovery_session.attributes
    end

    assert_redirected_to discovery_session_path(assigns(:discovery_session))
  end

  test "should show discovery_session" do
    get :show, id: @discovery_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discovery_session
    assert_response :success
  end

  test "should update discovery_session" do
    put :update, id: @discovery_session, discovery_session: @discovery_session.attributes
    assert_redirected_to discovery_session_path(assigns(:discovery_session))
  end

  test "should destroy discovery_session" do
    assert_difference('DiscoverySession.count', -1) do
      delete :destroy, id: @discovery_session
    end

    assert_redirected_to discovery_sessions_path
  end
end

require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin)
    @other_user = users(:other)
    @conversation = conversations(:one)
    @message = messages(:one)
  end

  test "should get index" do
    get :index, :format => 'json'
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end

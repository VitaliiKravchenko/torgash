require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin)
    @other_user = users(:other)
    @conversation = conversations(:one)
    @message = messages(:one)
  end

  test "should create message" do
    session[:user_id] = @user.id
    assert_difference('Message.count') do
      post :create, :format => 'json', :conversation_id => 1, message: { id: @message.id, body: @message.body, conversation_id: @message.conversation_id, user_id: @message.user_id }
    end
  end

  test "should get index" do
    session[:user_id] = @user.id
    get :index, :conversation_id => 1
    assert_response :success
  end

  test "should get index too" do
    session[:user_id] =  @other_user.id
    get :index, :conversation_id => 1
    assert_response :success
  end

  test "should not get index" do
    session[:user_id] = @user.id
    get :index, :conversation_id => 404
    assert :false
  end
end

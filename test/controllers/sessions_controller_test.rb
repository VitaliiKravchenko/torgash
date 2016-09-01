require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin)
  end
  
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    session[:user_id] = @user.id
    get :destroy
    assert_redirected_to root_path
  end

end

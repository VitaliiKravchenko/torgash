require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin)
    @other = users(:other)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {name: @user.name, role: @user.role, birthday: @user.birthday, city: @user.city, country: @user.country, email: @user.email, full_name: @user.full_name, login: @user.login, password: 'admin', password_confirmation: 'admin', state: @user.state, zip: @user.zip }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, :format => 'json', id: @user
    assert_response :success
  end

  test "should get edit" do
    session[:user_id] = @user.id
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    session[:user_id] = @user.id
    patch :update, id: @user, user: {  name: @user.name, role: @user.role, birthday: @user.birthday, city: @user.city, country: @user.country, email: @user.email, full_name: @user.full_name, login: @user.login, password: 'admin', password_confirmation: 'admin', state: @user.state, zip: 111111 }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    session[:user_id] = @user.id
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

  test "should not destroy other user" do
    session[:user_id] = @other.id
    assert_difference('User.count', 0) do
      delete :destroy, id: @user
    end

    assert_redirected_to root_path
  end
end

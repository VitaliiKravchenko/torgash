require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase
  setup do
    @micropost = microposts(:one)
    @product = products(:one)
    @user = users(:admin)
  end

  test "should get index" do
    get :index, :format => 'json'
    assert_response :success
    assert_not_nil assigns(:microposts)
  end

  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test "should create micropost" do
    session[:user_id] = @user.id
    assert_difference('Micropost.count') do
      post :create, :format => 'json', micropost: { content: @micropost.content, product_id: @micropost.product_id, user_id: @micropost.user_id }
    end

    assert_not_nil assigns(:micropost)
  end

  test "should show micropost" do
    get :show, id: @micropost
    assert_response :success
  end

  test "should get edit" do
    session[:user_id] = @user.id
    get :edit, id: @micropost
    assert_response :success
  end

  test "should update micropost" do
    session[:user_id] = @user.id
    patch :update, id: @micropost, micropost: { content: @micropost.content, product_id: @micropost.product_id, user_id: @micropost.user_id }
    assert_redirected_to product_path(:id => @micropost.product.id)
  end

  test "should destroy micropost" do
    session[:user_id] = @user.id
    assert_difference('Micropost.count', -1) do
      delete :destroy, id: @micropost
    end

    assert_redirected_to product_path(:id => @micropost.product.id)
  end
end

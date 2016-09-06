require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @user = users(:admin)
  end

  test "should get index" do
    get :index, :format => 'json'
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test "should create product" do
    session[:user_id] = @user.id
    assert_difference('Product.count') do
      post :create, product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    session[:user_id] = @user.id
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    session[:user_id] = @user.id
    patch :update, id: @product, product: {user_id: @user.id, description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    session[:user_id] = @user.id
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end

end

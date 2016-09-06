require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

#  fixtures :users, :products  

  def setup
    @user = users(:admin)
#    @product = @user.products.build(title: 1, description: 1, price: 1)
  end

  test "login with invalid information" do
    get log_in_path
    assert_template 'sessions/new'
    post log_in_path, session: { email: "", password: ""}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path, :format => 'json'
    assert flash.empty?
  end

  test "login with valid information" do
    get log_in_path
    post_via_redirect log_in_path, email: "admin@admin.ua", password: "admin"
    assert_redirected_to root_url
#    follow_redirect!, format: :json
#    assert_template 'products/index'
  end



end

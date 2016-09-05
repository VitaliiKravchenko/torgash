require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    @product = @user.products.build(title: 1, description: 1, price: 1)
  end

  test "login with invalid information" do
    get log_in_path
    assert_template 'sessions/new'
    post log_in_path, session: { email: "", password: ""}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get log_in_path
    assert flash.empty?
  end




end

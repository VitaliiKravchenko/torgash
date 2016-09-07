require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
#  fixtures :users, :products  

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
    get root_path, :format => 'json'
    assert flash.empty?
  end

  test "login with valid information" do
    get root_url, :format => 'json'
    json_response = JSON.parse(response.body) 
    assert_template '/'
    assert_select json_response["use"], "Users"
    assert_select "a[href=?]", log_in_path, count: 1
    assert_select 'title', "Torgash"
    get log_in_path
    post log_in_path, email: "admin@admin.ua", password: "admin", xhr: true

#    assert_redirected_to root_url, xhr: true # :format => 'json'
#    get root_url, xhr: true # :format => 'json'
    assert_template '/'
#    assert_select "a[href=?]", log_in_path, count: 0

#    delete log_out_path, :format => 'json'
#    assert_redirected_to root_url

#    assert_select "a[href=?]", log_in_path, count: 0
#    assert_select "a[href=?]", log_out_path

  end



end

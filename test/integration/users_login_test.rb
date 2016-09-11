require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
#  fixtures :users, :products  

  def setup
    @user = users(:admin)
    @product = @user.products.create!(title: 'test product', description: 1, price: 1)
  end

#  test "login with invalid information" do
#    get log_in_path
#    assert_template 'sessions/new'
#    post log_in_path, session: { email: "", password: ""}
#    assert_template 'sessions/new'
#    assert_not flash.empty?
#    get root_path, :format => 'json'
#    assert flash.empty?
#  end

  test "login with valid information" do
#    get root_url, :format => 'json'
#    json_response = JSON.parse(response.body) 
#    assert_template '/'
    visit( '/')
    assert_text('Listing')
    assert_text('Log in')
    click_link_or_button("Log in with password")
    assert_text('Email')
    fill_in 'Email', :with => 'admin@admin.ua'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    assert_text('Log out')
    assert_text('Signed in as admin')
    assert_text 'Listing Products'
    assert_text(@product.title)
    click_link @product.title
    assert_text 'Product comments'
    assert_text @product.description
    assert_current_path  product_path(@product)
    
#    page.has_content?('bla bla')
#    assert_select "a[href=?]", log_in_path, count: 1
#    assert_select 'title', "Torgash"
#    get log_in_path, :format => 'json'
#    post log_in_path, email: "admin@admin.ua", password: "admin", :format => 'json'

#    assert_redirected_to root_url, xhr: true # :format => 'json'
#    get root_url, xhr: true # :format => 'json'
#    assert_template '/'
#    assert_select "a[href=?]", log_in_path, count: 0

#    delete log_out_path, :format => 'json'
#    assert_redirected_to root_url

#    assert_select "a[href=?]", log_in_path, count: 0
#    assert_select "a[href=?]", log_out_path

  end



end

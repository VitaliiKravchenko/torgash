require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    @product = products(:one)
    OmniAuth.config.test_mode = true
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

  test "login with facebook profile" do
#    Capybara.current_driver = :selenium
    visit '/'
    assert_text 'Listing'
    mock_auth_hash_facebook
    click_link 'Log in with Facebook'
    assert_text 'Listing' 
    assert_text 'Log out'
    assert_no_text 'Log in with'
  end

begin
  test "login with valid information via mail and password" do
    Capybara.current_driver = :selenium
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

    click_link 'New Product'
    fill_in 'Title', :with => 'matras'
    fill_in 'Description', :with => 'pocket spring'
    fill_in 'Price', :with => 3851
    click_button 'Create Product'
    click_link 'Products' 

    assert_text(@product.title)
    click_link @product.title
    assert_text 'Product comments'
    assert_text @product.description
    assert_current_path  product_path(@product)
    click_link('Edit', :href => edit_product_path(@product))
    assert_text 'Editing Product'

    fill_in 'Price', :with => 15
    click_button 'Update Product'
    assert_current_path product_path(@product)
    assert_text '15'
    click_link('Edit', :href => edit_product_path(@product)) 

    click_link 'Show'
    assert_current_path product_path(@product)
    #accept_confirm do
      click_link 'Delete product'
    #end
    page.driver.browser.switch_to.alert.accept
    assert_text "Listing Products"
    assert_no_text @product.title

    click_link 'Log out'
    assert_text 'Log in with'
  end
end

end


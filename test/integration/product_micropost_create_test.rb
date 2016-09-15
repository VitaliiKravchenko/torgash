require 'test_helper'

class ProductMicropostCreateTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    @product = products(:one)
    @micropost = microposts(:one)
  end

  test "create and delete micropost" do
    Capybara.current_driver = :selenium
    visit '/'
    click_link 'Log in with password'
    fill_in 'Email', :with => 'admin@admin.ua'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    assert_text 'Log out'

    click_link @product.title
    assert_text @product.description
    assert_text @micropost.content
    assert_text 'Product comments'
    assert_no_text 'Please login to comment product'
    fill_in 'Content', :with => 'hello world'
    click_link_or_button 'Create Micropost' 
    assert_text 'hello world'
    assert_current_path product_path(@product)   

    click_link('Destroy', :href => micropost_path(@micropost)) 
    page.driver.browser.switch_to.alert.accept
    assert_no_text @micropost.content
  end

  test "unlogged user not allowed create micropost" do
    visit '/'
    click_link @product.title
    assert_not has_button?('Create Micropost')  
    assert_text 'Please login to comment product'
  end 





end

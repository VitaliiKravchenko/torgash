require 'test_helper'

class ProductMicropostCreateTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    @product = products(:one)
  end

  test "create micropost" do
#    Capybara.current_driver = :selenium
    visit '/'
    click_link 'Log in with password'
    fill_in 'Email', :with => 'admin@admin.ua'
    fill_in 'Password', :with => 'admin'
    click_button 'Log in'
    assert_text 'Log out'

    click_link @product.title
    assert_text @product.description
    assert_text 'Product comments'
    fill_in 'Content', :with => 'hello world'
    click_link_or_button 'Create Micropost' 
  end




end

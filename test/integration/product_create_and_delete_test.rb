require 'test_helper'

class ProductCreateAndDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @moderator = users(:moderator)
    @other_user = users(:other)
    @product_other = products(:two) 
    @product_admin = products(:one)
  end 

  test "other_user can create product and cannot delete other products" do
    log_in(@other_user, 'other')
    visit '/'
    assert_no_text 'Log in with'
    click_link 'New Product'
    fill_in 'Title', :with => 'matras'
    fill_in 'Description', :with => 'bonnel'
    fill_in 'Price', :with => 5432
    click_button 'Create Product'
    click_link 'Products' 
    assert_text 'bonnel'
    assert has_link?('Destroy', href: product_path(@product_other))
    assert has_link?('Edit', href: edit_product_path(@product_other))
    assert_not has_link?('Destroy', href: product_path(@product_admin))
    assert_not has_link?('Edit', href: edit_product_path(@product_admin))
    click_link(@product_admin.title)
    assert_not has_link?('Delete product', href: product_path(@product_admin))
    click_link('Products')
    click_link(@product_other.title)
    assert has_link?('Delete product', href: product_path(@product_other))
  end  

  test "admin is able to delete any products" do
    log_in(@admin, 'admin')
    visit '/'
    assert has_link?('Destroy', href: product_path(@product_other))
    assert has_link?('Destroy', href: product_path(@product_admin))
  end


  test "moderator is able to delete any products" do
    log_in(@moderator, 'moderator')
    visit '/'
    assert has_link?('Destroy', href: product_path(@product_other))
    assert has_link?('Destroy', href: product_path(@product_admin))
  end


end

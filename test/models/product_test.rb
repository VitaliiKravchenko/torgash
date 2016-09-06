require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:admin)
    @product = @user.products.build(title: 1, description: 1, price: 1)
  end

  test "product should be valid" do
    assert @product.valid?
  end

  test "product without title should be invalid" do
    @product.title = nil
    assert_not @product.valid?
  end


  test "product without price should be invalid" do
    @product.price = nil
    assert_not @product.valid?
  end

  test "product description more than 2000 char  should be invalid" do
    @product.description = "a" * 2001
    assert_not @product.valid?
  end

  test "product micropost should be deleted with product" do
    @micropost = @product.microposts.build(content: 1, user_id: @user.id)
    @micropost.save!
    assert @micropost.valid?
    assert_difference 'Micropost.count', -1 do
      @product.destroy
    end
  end 


end

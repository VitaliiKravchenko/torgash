require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:admin)
    @product = @user.products.build(title: 1, description: 1, price: 1)
    @micropost = @product.microposts.build(content: 1, user_id: 1)
  end

  test "micropost should be valid" do
    assert @micropost.valid?
  end

  test "micropost without content should be invalid" do
    @micropost.content = "  "
    assert_not @micropost.valid?
  end

  test "micropost with length more than 300 is invalid" do
    @micropost.content = "v" * 301
    assert_not @micropost.valid?
  end

  test "micropost should be deleted with user" do
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end

end

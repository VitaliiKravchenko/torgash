require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:admin)
    @user1 = User.new(name: @user.name, role: @user.role, birthday: @user.birthday, city: @user.city, country: @user.country, email: 'admin@admin.ua', full_name: @user.full_name, login: @user.login, password: 'admin', password_confirmation: 'admin', state: @user.state, zip: @user.zip) 
  end

  test "should be valid" do
    assert @user1.valid?
  end

  test "name should be present" do
    @user1.name = "     "
    assert_not @user1.valid?
  end

  test "name should be not very long" do
    @user1.name = "bla"*120
    assert_not @user1.valid?
  end

  test "email should be invalid" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user1.email = invalid_address
      assert_not @user1.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email should be valid" do 
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user1.email = valid_address
      assert @user1.valid?, "#{valid_address.inspect} should be valid"
    end
  end



end

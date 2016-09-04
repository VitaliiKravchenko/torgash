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

  test "email address should be unique" do
    duplicate_user = @user1.dup
    duplicate_user.email = @user1.email.upcase
    @user1.save
    duplicate_user.save
    assert_not duplicate_user.valid?
  end  

  test "password should be present" do
    @user1.password = @user1.password_confirmation = " " * 4
    assert_not @user1.valid?
  end

  test "password should have minimum length" do
    @user1.password = @user1.password_confirmation = "bl"
    assert_not @user1.valid?
  end

  test "user product should be destroyed with user" do
    @user1.save
    @user1.products.create!(title: 1, description: 1, price: 1)
    assert_difference 'Product.count', -1 do
      @user1.destroy
    end
  end 
  
  test "user conversation should be destroyed with user" do
    @user1.save
    @user1.conversations.create!(sender_id: 1, recipient_id: 2)    
    @user1.conversations.first.messages.create!(body: 1, conversation_id: 1, user_id: 1)
    assert_difference 'Conversation.count', -1 do
      @user1.destroy
    end
  end 

  test "user message should be destroyed with user" do
    @user1.save
    @user1.conversations.create!(sender_id: 1, recipient_id: 2)    
    @user1.conversations.first.messages.create!(body: 1, conversation_id: 1, user_id: 1)
    assert_difference 'Message.count', -1 do
      @user1.destroy
    end
  end 

end

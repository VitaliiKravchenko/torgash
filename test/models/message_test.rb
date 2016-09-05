
require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  setup do
    @user = users(:admin)
    @other_user = users(:other)
    @conversation = conversations(:one)
    @message = messages(:one)
  end

  test "message should be valid" do
    assert @message.valid?
  end

  test "message without content should be invalid" do
    @message.body = "  "
    assert_not @message.valid?
  end

  test "message with length more than 2000 is invalid" do
    @message.body = "v" * 2001
    assert_not @message.valid?
  end

  test "message should be deleted with user" do
    assert_difference 'Message.count', -1 do
      @user.destroy
    end
  end

end

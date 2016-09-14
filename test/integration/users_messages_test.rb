
require 'test_helper'

class UsersMessagesTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    OmniAuth.config.test_mode = true
    log_in #admin
    @other_user = users(:other)
  end

  test "login and send message" do
    visit '/'
    assert_no_text 'Log in'
    click_link 'Conversations'
    assert_text 'Mailbox'
    assert_text @other_user.name
    click_link 'Message me!'
  end



end

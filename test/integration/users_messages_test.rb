
require 'test_helper'

class UsersMessagesTest < ActionDispatch::IntegrationTest

  def setup
#    Capybara.current_driver = :selenium
#    Capybara.app_host = "http://localhost:3037"
#    Capybara.server_port = 3037
    @user = users(:admin)
    OmniAuth.config.test_mode = true
    log_in(@user, 'admin') #admin
    @other_user = users(:other)
  end

  test "login and send message" do
    visit '/'
    assert_no_text 'Log in'
    click_link 'Conversations'
    assert_text 'Mailbox'
    assert_text @other_user.name
    click_link('Message me!', :href => "/conversations?recipient_id=#{@other_user.id}&sender_id=#{@user.id}")
    find(:link_or_button, 'Add Reply')
    fill_in "message[body]", :with => "phone me please"
    click_button 'Add Reply'
    assert_text 'phone me please'
    fill_in "message[body]", with: "hi customer"
    click_button 'Add Reply'
    assert_text 'hi customer'


    
  end



end

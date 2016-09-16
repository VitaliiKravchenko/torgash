require 'test_helper'

class UsersDeleteAnotherUserTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @moderator = users(:moderator)
    @other_user = users(:other)
  end

  test "other user cannot delete another user do" do
    log_in(@other_user, 'other')
    visit '/'
    assert_no_text 'Log in with'
    click_link 'Users'
    assert_text 'Listing Users'
    assert has_link?('Destroy', href: user_path(@other_user)) 
    assert has_link?('Edit', href: edit_user_path(@other_user))
    assert has_no_link?('Destroy', href: user_path(@admin)) 
    assert has_no_link?('Edit', href: edit_user_path(@admin))
  end

  test "admin can delete everybody" do
    log_in(@admin, 'admin')
    visit '/'
    click_link 'Users'
    assert_text 'Listing Users'
    assert has_link?('Destroy', href: user_path(@other_user)) 
    assert has_link?('Edit', href: edit_user_path(@other_user))
    assert has_link?('Destroy', href: user_path(@admin)) 
    assert has_link?('Edit', href: edit_user_path(@admin))
  end

  test "moderator cannot delete or edit another user" do
    log_in(@moderator, 'moderator')
    visit '/'
    click_link 'Users'
    assert_text 'Listing Users'
    assert_text 'Signed in as moderator'
    assert has_link?('Destroy', href: user_path(@moderator)) 
    assert has_link?('Edit', href: edit_user_path(@moderator))
    assert has_no_link?('Destroy', href: user_path(@other_user)) 
    assert has_no_link?('Edit', href: edit_user_path(@other_user))
    
  end

end

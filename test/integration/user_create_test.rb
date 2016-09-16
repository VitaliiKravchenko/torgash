require 'test_helper'

class UserCreateTest < ActionDispatch::IntegrationTest

  def setup
    @admin
    OmniAuth.config.test_mode = true
  end

  test "Signup new user through form" do
    visit '/'
    click_link 'Sign up'
    fill_in 'Login', with: 'test'
    fill_in 'Name', with: 'test'
    fill_in 'user[full_name]', with: 'test' 
    fill_in 'Birthday', with: '01.01.2000'
    fill_in 'Email', with: 'test@test.ua'
    fill_in 'Country', with: 'test'
    fill_in 'State', with: 'test'
    fill_in 'City', with: 'test'
    fill_in 'Zip', with: '1000'
    fill_in 'Password', with: 'test'
    fill_in 'user[password_confirmation]', with: 'test'
    click_button 'Create User' 
    assert_text 'User was successfully created.'
    assert_no_text 'Log in with' 
  end

  test "signup new user through facebook" do
    visit '/'
    assert_text 'Listing'
    mock_auth_hash_facebook
    click_link 'Log in with Facebook'
    assert_text 'Listing' 
    assert_text 'Log out'
    assert_no_text 'Log in with'
  end

end 

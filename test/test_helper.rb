ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
require 'capybara/rails'
Minitest::Reporters.use!

require 'database_cleaner'

DatabaseCleaner.strategy = :transaction  

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  # Reset sessions and driver between tests
  # Use super wherever this method is redefined in your individual test classes
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
    DatabaseCleaner.clean
  end
end

class ActiveRecord::Base  
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end  
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection  
def mock_auth_hash_facebook
    OmniAuth.config.mock_auth[:facebook] = {
        provider: 'facebook',
        uid: '1073948082692185',
        info: {
            name: 'Vitaliy Kravchenko',
        },
        credentials: {
            token: 'mock_token',
            expires_at: 2428232400,
            secret: 'mock_secret'
        }
    }
end

#def log_in
#    visit( '/')
#    click_link_or_button("Log in with password")
#    fill_in 'Email', :with => 'admin@admin.ua'
#    fill_in 'Password', :with => 'admin'
#    click_button 'Log in'
#end
  
def log_in(user, password)
    visit( '/')
    click_link_or_button("Log in with password")
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => password
    click_button 'Log in'
end

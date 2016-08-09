class User < ActiveRecord::Base
  has_secure_password
  geocoded_by :city   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  
end

class User < ActiveRecord::Base
#  has_secure_password
  has_many :products
  has_many :microposts
  validates :login, presence: true
  validates :full_name, presence: true
  validates :birthday, presence: true
  validates :email, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :name, presence: true
  validates :city, presence: true
  validates :zip, presence: true
  validates :password, presence: true

  attr_accessor :password, :password_confirmation
  geocoded_by :city   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  before_save :encrypt_password
  after_commit :reindex_product

  def reindex_product
    Product.reindex
  end
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      
       end
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end

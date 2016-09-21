class User < ActiveRecord::Base
  paginates_per 15 
  has_many :products, :foreign_key => :user_id, dependent: :destroy
  has_many :microposts, dependent: :destroy
  has_many :conversations,:foreign_key => :sender_id, dependent: :destroy
  
  validates :login, :full_name,:birthday,:country,:state,:name,:city,:zip, presence: true, length: { in: 1..200 }, if: "provider.nil?"

  attr_accessor :password, :password_confirmation
  if Rails.env != 'test'
#  unless ['test', 'development'].include?(Rails.env)
    geocoded_by :address   # can also be an IP address
    after_validation :geocode          # auto-fetch coordinates
  end
  before_save :encrypt_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { in: 3..200}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}, if: "provider.nil?"
  validates :password, :password_confirmation, presence: true, length: { in: 4..200}, if: "provider.nil?"
  def address
    [country, state, city].compact.join(', ')
  end

  def self.from_omniauth(auth)
      where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
        user.provider = auth[:provider]
        user.uid = auth[:uid]
        @info = auth[:info]
        user.name = @info[:name]
        @credentials = auth[:credentials]
        user.oauth_token = @credentials[:token]
        #user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(@credentials[:expires_at])
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
  
  def update_with_token!
    update_column(:token, generate_token)
  end

  def generate_token
    SecureRandom.urlsafe_base64
  end

end

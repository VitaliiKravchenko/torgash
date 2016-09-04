class User < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :microposts, dependent: :destroy
  has_many :conversations,:foreign_key => :sender_id, dependent: :destroy
  
  validates :login, :full_name,:birthday,:country,:state,:name,:city,:zip, presence: true, length: { in: 1..50 }, if: "provider.nil?"

  attr_accessor :password, :password_confirmation
  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  before_save :encrypt_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { in: 3..100}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, :password_confirmation, presence: true, length: { in: 4..200}
  def address
    [country, state, city].compact.join(', ')
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
  
  def update_with_token!
    update_column(:token, generate_token)
  end

  def generate_token
    SecureRandom.urlsafe_base64
  end

end

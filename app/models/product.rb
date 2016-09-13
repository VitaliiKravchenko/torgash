class Product < ActiveRecord::Base

  attr_accessor :image
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :microposts, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true
  validates :price, presence: true
  validates :description, length: { maximum: 2000}
  paginates_per 10 
    
  def self.search(search)
    joins(:user).where('products.title LIKE ? OR products.description LIKE ? OR users.name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  end
end

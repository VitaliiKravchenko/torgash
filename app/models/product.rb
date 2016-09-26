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
    joins(:user).where('lower(products.title) LIKE ? OR lower(products.description) LIKE ? OR lower(users.name) LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  end
end

class Product < ActiveRecord::Base

  attr_accessor :image
  mount_uploader :image, ImageUploader

#  searchkick
  belongs_to :user
  has_many :microposts, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true
  validates :price, presence: true
  def search_data
      attributes.merge(
        user_name: user(&:name)
      )
  end
  
#  def self.search(search)
#    where("title LIKE ?", "%#{search}%")
#    where("description LIKE ?", "%#{search}%")
##    where("title LIKE ?", "%#{search}%")
#  end
    
  def self.search(search)
#    where("title LIKE ?", "%#{search}%")
 #   where("description LIKE ?", "%#{search}%")
    joins(:user).where('products.title LIKE ? OR products.description LIKE ? OR users.name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  end
end

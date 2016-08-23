class Product < ActiveRecord::Base
  searchkick
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
end

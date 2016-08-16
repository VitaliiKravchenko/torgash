class Product < ActiveRecord::Base
  belongs_to :user
  has_many :microposts
  validates :user_id, presence: true
end

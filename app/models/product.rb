class Product < ActiveRecord::Base
  belongs_to :user
  has_many :microposts, dependent: :destroy
  validates :user_id, presence: true
end

class Micropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  
  validates :content, presence: true, length: { in: 1..300}
end

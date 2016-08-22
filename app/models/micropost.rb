class Micropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  
  validates: content, presence: true, length: { in: 2..300}
end

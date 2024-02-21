class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :post_id }
  
  belongs_to :user, optional: true
  belongs_to :post, optional: true
end

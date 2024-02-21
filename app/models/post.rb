class Post < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, :content, presence: true
  validates_inclusion_of :anonymous, in: [true, false]

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end

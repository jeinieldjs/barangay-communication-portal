class Complaint < ApplicationRecord
  belongs_to :user
  validates :subject, :description, presence: true
  enum status: { pending: 'pending', resolved: 'resolved'}
end

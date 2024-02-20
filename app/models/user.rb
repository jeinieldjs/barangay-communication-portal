class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  validates :first_name, :last_name, :email, :complete_address, :province, :city_municipality, :barangay, :role, :status, presence: true
  validates :contact_number, presence: true, numericality: { only_integer: true }, length: { is: 11 }

  enum role: { admin: 'admin', resident: 'resident' }
  enum status: { pending: 'pending', approved: 'approved', rejected: 'rejected' }
end

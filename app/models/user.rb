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

  has_many :announcements, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :complaints, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_create :send_status_email

  private

  def send_status_email
    if status == 'pending'
      UserMailer.pending_email(self).deliver_later
    end
  end
  

end

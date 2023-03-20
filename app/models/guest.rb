class Guest < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :rooms, through: :bookings

  validates :f_name, :l_name, :email, :phone_number, presence: true
  validates :phone_number, :email, uniqueness: true
end

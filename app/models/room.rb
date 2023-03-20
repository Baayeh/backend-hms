class Room < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :room_type, :room_desc, :room_img, :room_number, :room_max_guests, :room_size, :room_price, :beds, presence: true
end

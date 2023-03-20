class Booking < ApplicationRecord
  has_one :payment, dependent: :destroy
  belongs_to :room
  belongs_to :guest

  validates :check_in_date, :check_out_date, :room, :guest, presence: true

  validate :no_overlapping_bookings
  validate :check_in_date_before_check_out_date

  private

  def no_overlapping_bookings
    if room.bookings.where("(check_in_date <= ? AND check_out_date >= ?) OR (check_in_date <= ? AND check_out_date >= ?)", check_in_date, check_in_date, check_out_date, check_out_date).any?
      errors.add(:base, "This room is already booked for the selected dates")
    end
  end

  def check_in_date_before_check_out_date
    if check_in_date.present? && check_out_date.present? && check_in_date > check_out_date
      errors.add(:base, "Please select an earlier check-in date or a later check-out date.")
    end
  end
end

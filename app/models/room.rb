class Room < ApplicationRecord
  has_many :room_classifications, dependent: :destroy
  has_many :classifications, through: :room_classifications
  has_many :reservations, dependent: :destroy

  def self.available_on(start_date, end_date)
    Room.where.not(id: Reservation.where('check_in <= ? AND check_out >= ?', end_date, start_date).pluck(:room_id))
  end
end

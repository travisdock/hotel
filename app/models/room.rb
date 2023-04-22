class Room < ApplicationRecord
  #has_many :room_types, dependent: :destroy
  #has_many :types, through: :room_types
  has_many :reservations, dependent: :destroy

  def self.available_on(start_date, end_date)
    Room.where.not(id: Reservation.where('check_in <= ? AND check_out >= ?', end_date, start_date).pluck(:room_id))
  end
end

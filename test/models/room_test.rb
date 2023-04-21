require "test_helper"

class RoomTest < ActiveSupport::TestCase
  test "should find available rooms" do
    room_1 = Room.create(name: "test")
    room_2 = Room.create(name: "test1")
    room_3 = Room.create(name: "test2")
    reservation_1 = Reservation.create(room_id: room_1.id, check_in: Date.today, check_out: Date.today + 1)
    available_rooms = Room.available_on(Date.today, Date.today + 1)
    assert_includes available_rooms, room_2
    assert_includes available_rooms, room_3
    assert_not_includes available_rooms, room_1
  end
end

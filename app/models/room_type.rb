class RoomType < ApplicationRecord
  belongs_to :room
  belongs_to :type
end

class Classification < ApplicationRecord
  has_many :room_classifications, dependent: :destroy
  has_many :rooms, through: :room_classifications
end

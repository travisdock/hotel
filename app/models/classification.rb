class Classification < ApplicationRecord
  has_many :room_classifications, dependent: :destroy
end

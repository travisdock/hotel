class Property < ApplicationRecord
  has_many :rooms, dependent: :destroy
  # has_many :users(employees, not guests)
end

class AddBasePriceToRooms < ActiveRecord::Migration[7.0]
  def change
    add_monetize :rooms, :base_price
  end
end

class ChangeRoomNumberToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :rooms, :room_number, :name
  end
end

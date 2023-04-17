class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :room, null: false, foreign_key: true
      t.date :check_in
      t.date :check_out

      t.timestamps
    end
  end
end

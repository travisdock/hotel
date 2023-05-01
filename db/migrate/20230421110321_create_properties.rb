class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name

      t.timestamps
    end

    add_column :rooms, :property_id, :integer
  end
end

class CreatePricingStrategies < ActiveRecord::Migration[7.0]
  def change
    create_table :pricing_strategies do |t|
      t.monetize :price, null: false
      t.decimal :multiplier, precision: 6, scale: 4
      t.decimal :min_occupancy, precision: 4, scale: 2
      t.decimal :max_occupancy, precision: 4, scale: 2
      t.date :start_date
      t.date :end_date
      t.integer :distance_in_time
      t.string :distance_unit

      t.timestamps
    end
  end
end

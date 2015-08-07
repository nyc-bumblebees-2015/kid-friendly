class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :place_id, null: false
      t.float :lng, null: false
      t.float :lat, null: false
      t.string :formatted_address, null: false
      t.string :formatted_phone_number    
      t.boolean :cribs
      t.boolean :changing_stations
      t.boolean :high_chairs
      t.boolean :family_restrooms
      t.boolean :restrooms
      t.boolean :nursing_stations
      t.boolean :water_fountains

      t.timestamps null: false
    end
  end
end

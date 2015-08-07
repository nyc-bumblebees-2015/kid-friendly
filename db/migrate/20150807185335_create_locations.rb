class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :place_id, null: false
      t.float :lng, null: false
      t.float :lat, null: false
      t.string :street_num, null: false
      t.string :route, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :postal_code, null: false
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

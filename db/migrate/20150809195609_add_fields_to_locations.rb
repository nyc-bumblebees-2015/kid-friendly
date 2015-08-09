class AddFieldsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :play_areas, :string
    add_column :locations, :yelp_id, :string
    add_column :locations, :yelp_url, :string
  end
end

class ChangePlayAreasInLocation < ActiveRecord::Migration
  def change
    change_column :locations, :play_areas, 'boolean USING CAST(play_areas AS boolean)'
  end
end

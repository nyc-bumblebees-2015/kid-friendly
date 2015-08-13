ActiveAdmin.register Location do
  permit_params :name,
                :lng,
                :lat,
                :place_id,
                :formatted_address,
                :formatted_phone_number,
                :cribs,
                :changing_stations,
                :high_chairs,
                :family_restrooms,
                :restrooms,
                :nursing_stations,
                :water_fountains,
                :play_areas
end


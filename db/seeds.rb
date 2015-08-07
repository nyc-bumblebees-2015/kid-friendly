locations = [
 { name: "Starbucks",
   place_id: "ChIJbR_XgT1awokRkaDripRk7Ns",
   lng: -74.006826,
   lat: 40.706132,
   formatted_address: "80 Pine Street, New York, NY 10005, United States",
   formatted_phone_number: "(212) 480-3970",
   cribs: nil,
   changing_stations: nil,
   high_chairs: nil,
   family_restrooms: nil,
   restrooms: true,
   nursing_stations: nil,
   water_fountains: nil
 },

 { name: "Starbucks",
   place_id: "ChIJKWoRxFhYwokRxuzYFXkTyBI",
   lng:-73.984914,
   lat:40.769435,
   formatted_address: "2 Columbus Circle, New York, NY 10023, United States",
   formatted_phone_number: "(212) 489-6757",
   cribs: nil,
   changing_stations: nil,
   high_chairs: nil,
   family_restrooms: nil,
   restrooms: true,
   nursing_stations: nil,
   water_fountains: nil
 },

 { name: "Neapolitan Express",
   place_id: "ChIJPzAo_hZawokRg4hfOTNB3NU",
   lng:-74.009668,
   lat:40.706983,
   formatted_address:"40 Wall Street, New York, NY 10260, United States",
   formatted_phone_number:"(646) 918-6169",
   cribs: nil,
   changing_stations: nil,
   high_chairs: nil,
   family_restrooms: nil,
   restrooms: nil,
   nursing_stations: nil,
   water_fountains: nil
 },

 { name: "Battery Park",
   place_id: "ChIJraKL-BJawokREpxDmF5GcL4",
   lng:-74.017028,
   lat:40.703278,
   formatted_address:"New York, NY, United States",
   formatted_phone_number:nil,
   cribs: nil,
   changing_stations: nil,
   high_chairs: nil,
   family_restrooms: nil,
   restrooms: nil,
   nursing_stations: nil,
   water_fountains: nil
 },

 { name: "Empire State Bldg",
   place_id: "ChIJtcaxrqlZwokRfwmmibzPsTU",
   lng:-73.9856554,
   lat:40.7484404,
   formatted_address:"Empire State Bldg, 350 5th Ave, New York, NY 10118, USA",
   formatted_phone_number:nil,
   cribs: nil,
   changing_stations: nil,
   high_chairs: nil,
   family_restrooms: nil,
   restrooms: nil,
   nursing_stations: nil,
   water_fountains: nil
 }

]

locations.each do |location|
   Location.create(location)
end


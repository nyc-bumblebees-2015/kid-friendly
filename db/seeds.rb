locations = [
 { name: "Starbucks",
   place_id: "ChIJbR_XgT1awokRkaDripRk7Ns",
   lng: -74.006826,
   lat: 40.706132,
   formatted_address: "80 Pine Street, New York, NY 10005, United States",
   formatted_phone_number: "(212) 480-3970",
   cribs: nil,
   changing_stations: true,
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
   nursing_stations: true,
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
{ name: "Yosemite National park",
   place_id: "ChIJxeyK9Z3wloAR_gOA7SycJC0",
   lng:-119.538329,
   lat:37.865101,
   formatted_address:"California, United States",
   formatted_phone_number:"(209) 372-0200",
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

].shuffle

users = [

  { first_name: "Vic",
    last_name: "Zhu",
    email: "duanereade@don.com",
    username: "dondoodie",
    password: "123456"
  }
]

reviews = [

  { location_id: 3,
    user_id: 1,
    overall_rating: 4,
    cleanliness_rating: 4,
    spaciousness_rating: 3,
    body: "This place is crowded on weekdays, but the wait isn't too long. I would bring my kid here because he likes Mike's hot honey."
  }
]

likes = [
  { user_id: 1,
    review_id: 1
  }
]


locations.each do |location|
   Location.create(location)
end

users.each do |user|
   User.create(user)
end

reviews.each do |review|
   Review.create(review)
end

likes.each do |like|
   Like.create(like)
end


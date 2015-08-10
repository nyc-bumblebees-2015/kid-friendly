FactoryGirl.define do
  factory :location do
    name "Starbucks"
    place_id "ChIJbR_XgT1awokRkaDripRk7Ns"
    lng -74.006826
    lat 40.706132
    formatted_address "80 Pine Street, New York, NY 10005, United States"
    formatted_phone_number "(212) 480-3970"
    cribs true
    changing_stations true
    high_chairs true
    family_restrooms true
    restrooms true
    nursing_stations false
    water_fountains nil
    play_areas nil
    yelp_id nil
    yelp_url nil
  end
end
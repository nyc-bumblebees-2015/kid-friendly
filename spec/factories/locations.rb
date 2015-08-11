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

    factory :no_phone_number do
      name "Philadelphia"
      place_id "ChIJ60u11Ni3xokRwVg-jNgU9Yk"
      formatted_address "Philadelphia, PA, USA"
      formatted_phone_number nil
      lat "39.9525839"
      lng "-75.16522150000003"
    end

    factory :blank_phone_number do
      name "Philadelphia"
      place_id "ChIJ60u11Ni3xokRwVg-jNgU9Yk"
      formatted_address "Philadelphia, PA, USA"
      formatted_phone_number " "
      lat 39.9525839
      lng -75.16522150000003
    end

    factory :international do
      name "Posudion, Magazin"
      formatted_phone_number "8 (495) 620-34-83"
      formatted_address "Red Square, 3, ГУМ, Moskva, Russia, 109012"
      lat 55.754634
      lng 37.62149599999998
      place_id "ChIJBZbmYllKtUYRYI-w1SIN_WU"
    end

    factory :not_in_yelp do
      formatted_address "267 3rd Avenue, Brooklyn, NY 11215, United States"
      formatted_phone_number "(718) 534-0451"
      lat 40.677791
      lng -73.98551099999997
      name "Super 8 Brooklyn / Park Slope Hotel"
      place_id "ChIJbbhVClVawokRvFU-hqN-lvk"
    end
  end
end

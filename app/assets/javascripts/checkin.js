var map;
var infowindow;
var lat;
var lng;
var data;

function initialize(){
  navigator.geolocation.getCurrentPosition(function(position) {
    lat = position.coords.latitude;
    lng = position.coords.longitude;
    setup()
  });
}

function setup() {
  var pointOfInterest = new google.maps.LatLng(lat, lng);
  map = new google.maps.Map(document.getElementById('map-canvas'), {
    center: pointOfInterest,
    zoom: 15
  });
  var request = {
    location: pointOfInterest,
    radius: 500,
    types: ['amusement_park',
            'aquarium',
            'art_gallery',
            'bicycle_store',
            'book_store',
            'bowling_alley',
            'cafe',
            'campground',
            'casino',
            'food',
            'gym',
            'library',
            'lodging',
            'movie_theater',
            'museum',
            'park',
            'restaurant',
            'rv_park',
            'shopping_mall',
            'spa',
            'stadium',
            'zoo',
            'store',
            'gas_station',
            'grocery_or_supermarket',
            'laundry',
            'parking',
            'subway_station',
            'train_station']
  };
  infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);
  service.nearbySearch(request, callback);
}

function callback(results, status) {
  var ary = [];
  if (status == google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      ary.push({name: results[i].name, vicinity: results[i].vicinity, placeID: results[i].place_id, icon: results[i].icon});
      createMarker(results[i]);
    }
      var context = {locations:ary};
      var source = $("#google-location-template").html();
      var template = Handlebars.compile(source);
      $('#locals_list').append(template(context))
  }
}

function createMarker(place) {

  var icons = {
    lodging: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/lodging.png'
    },
    amusement_park: {
      icon: 'http://maps.google.com/mapfiles/kml/pal4/icon47.png'
    },
    art_gallery: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/arts.png'
    },
    bicycle_store: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/cycling.png'
    },
    restaurant:{
      icon: 'https://maps.google.com/mapfiles/ms/micons/restaurant.png'
    },
    bar:{
      icon: 'http://maps.google.com/mapfiles/ms/micons/bar.png'
    },
    book_store:{
      icon: 'http://maps.google.com/mapfiles/ms/micons/convienancestore.png'
    },
    bowling_alley:{
      icon:  'http://maps.google.com/mapfiles/ms/micons/sportvenue.png'
    },
    cafe:{
      icon: 'http://maps.google.com/mapfiles/ms/micons/coffeehouse.png'
    },
    campground: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/campground.png'
    },
    casino: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/dollar.png'
    },
    food: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/snack_bar.png'
    },
    gym: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/sportvenue.png'
    },
    library: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon10.png'
    },
    movie_theater: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/movies.png'
    },
    museum: {
      icon: 'https://upload.wikimedia.org/wikipedia/commons/8/87/MapMarkerMuseum.png'
    },
    park: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon4.png'
    },
    rv_park: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/truck.png'
    },
    shopping_mall: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/shopping.png'
    },
    spa: {
      icon: 'http://www.tips4italiantrips.com/wp-content/uploads/leaflet-maps-marker-icons/lodging_0star.png'
    },
    stadium: {
      icon: 'http://icons.iconarchive.com/icons/icons-land/gis-gps-map/32/Stadium-icon.png'
    },
    zoo: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/tree.png'
    },
    store: {
      icon:'http://maps.google.com/mapfiles/ms/micons/convienancestore.png'
    },
    gas_station: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/gas.png'
    },
    grocery_or_supermarket: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/grocerystore.png'
    },
    laundry: {
      icon: 'http://google-maps-icons.googlecode.com/files/laundromat.png'
    },
    parking: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/parkinglot.png'
    },
    subway_station: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/subway.png'
    },
    train_station:{
      icon: 'http://maps.google.com/mapfiles/ms/micons/subway.png'
    },
    meal_takeaway: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/snack_bar.png'
    },
    home_goods_store: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/convienancestore.png'
    },
    hardware_store: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/convienancestore.png'
    },
    accounting: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/dollar.png'
    },
    airport: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon56.png'
    },
    aquarium: {
      icon: 'http://maps.google.com/mapfiles/kml/pal4/icon47.png'
    },
    atm: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/dollar.png'
    },
    bakery: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/snack_bar.png'
    },
    bank: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/dollar.png'
    },
    beauty_salon: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/salon.png'
    },
    bus_station: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/bus.png'
    },
    car_dealer: {
      icon: 'http://maps.google.com/mapfiles/kml/pal4/icon62.png'
    },
    car_rental: {
      icon: 'http://maps.google.com/mapfiles/kml/pal4/icon62.png'
    },
    car_repair: {
      icon: 'http://maps.google.com/mapfiles/kml/pal4/icon62.png'
    },
    car_wash: {
      icon: 'http://maps.google.com/mapfiles/kml/pal4/icon62.png'
    },
    cemetery: {
      icon: 'http://google-maps-icons.googlecode.com/files/cemetary.png'
    },
    church: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon11.png'
    },
    city_hall: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon10.png'
    },
    embassy: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon10.png'
    },
    establishment: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon10.png'
    },
    clothing_store: {
      icon:'http://maps.google.com/mapfiles/ms/micons/shopping.png'
    },
    court_house: {
      icon: 'https://upload.wikimedia.org/wikipedia/commons/8/87/MapMarkerMuseum.png'
    },
    dentist: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/hospitals.png'
    },
    department_store: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/shopping.png'
    },
    doctor: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/hospitals.png'
    },
    electrician: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/electronics.png'
    },
    electronics_store: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/electronics.png'
    },
    finance: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/dollar.png'
    },
    fire_station: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/firedept.png'
    },
    florist: {
      icon: 'https://upload.wikimedia.org/wikipedia/commons/7/70/Map_marker_icon_%E2%80%93_Nicolas_Mollet_%E2%80%93_Flowers_%E2%80%93_Nature_%E2%80%93_simple.png'
    },
    funeral_home: {
      icon: 'http://google-maps-icons.googlecode.com/files/cemetary.png'
    },
    furniture_store: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/shopping.png'
    },
    general_contractor: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/man.png'
    },
    hair_care: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/salon.png'
    },
    health: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/hospitals.png'
    },
    hindu_temple: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon11.png'
    },
    hospital: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/hospitals.png'
    },
    insurance_agency: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/dollar.png'
    },
    jewelry_store: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/shopping.png'
    },
    lawyer: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/man.png'
    },
    liquor_store: {
      icon: 'http://liquidity.co.za/wp-content/uploads/leaflet-maps-marker-icons/conveniencestore.png'
    },
    local_goverment_office: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon10.png'
    },
    locksmith: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/convienancestore.png'
    },
    meal_delivery: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/snack_bar.png'
    },
    mosque: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon11.png'
    },
    movie_rental: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/movies.png'
    },
    moving_company: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/truck.png'
    },
    night_club: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/bar.png'
    },
    painter: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/man.png'
    },
    pet_store: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/shopping.png'
    },
    pharmacy:{
      icon: 'http://maps.google.com/mapfiles/ms/micons/hospitals.png'
    },
    physiotherapist:{
      icon: 'http://maps.google.com/mapfiles/ms/micons/man.png'
    },
    place_of_worship:{
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon11.png'
    },
    plumber: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon11.png'
    },
    police: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/police.png'
    },
    post_office: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/postoffice-us.png'
    },
    real_estate_agency: {
      icon: 'http://maps.google.com/mapfiles/kml/pal3/icon48.png'
    },
    roofing_contractor: {
      icon: 'http://maps.google.com/mapfiles/kml/pal3/icon48.png'
    },
    school: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon10.png'
    },
    shoe_store: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/shopping.png'
    },
    storage: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon2.png'
    },
    synagogue: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon11.png'
    },
    taxi_stand: {
      icon: 'http://maps.google.com/mapfiles/kml/pal4/icon54.png'
    },
    travel_agency: {
      icon: 'http://maps.google.com/mapfiles/ms/micons/plane.png'
    },
    university: {
      icon: 'http://maps.google.com/mapfiles/kml/pal2/icon10.png'
    },
    veterinary_care:{
      icon: 'http://maps.google.com/mapfiles/ms/micons/shopping.png'
    }

  }
  var locationType = place.types[0]
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
    map: map,
    icon: icons[locationType].icon,
    position: place.geometry.location,
  });

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
  });
}

google.maps.event.addDomListener(window, 'load', initialize);

$(document).ready(function(){
  $('.new-checkin').hide();
  $('#checkin-submit-btn').toggle(false);
  $('#location_changing_stations, #location_nursing_stations').on('click', function(){
    if($('#location_changing_stations').is(':checked') || $('#location_nursing_stations').is(':checked')) {
      $('#checkin-submit-btn').toggle(true);
    } else {
      $('#checkin-submit-btn').toggle(false);
    };
  });
  $('body').on('click','.result-row', function(){
    $('.new-checkin').show()
    $('.result-row').removeClass('selected-row');
    $(event.target).addClass('selected-row');
      var placeID = event.target.dataset.place_id
      var request = {
      placeId: placeID
      };
      service = new google.maps.places.PlacesService(map);
      service.getDetails(request, callback);
      function callback(place, status) {
        data = {name: place.name, place_id: place.place_id, lng: place.geometry.location.K, lat: place.geometry.location.G, formatted_address: place.formatted_address, formatted_phone_number: place.formatted_phone_number}
      };
  });
  $(".new-checkin").on('submit', function(event){
      for(var key in data){
        $('<input />').attr('type', 'hidden')
        .attr('name', "location[" + key + "]")
        .attr('value', data[key])
        .prependTo('.new-checkin');
      };
  });
});

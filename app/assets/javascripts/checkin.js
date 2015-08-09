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
            'museum','park',
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
  console.log(results);
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
  var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
  var icons = {
    lodging: {
      icon: iconBase + 'lodging_maps.png'
    }
  }
  var locationType = place.types[0]
  console.log(place.types[0])
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
  $('.new_location').hide();
  $('#checkin-submit-btn').toggle(false);
  $('#location_changing_stations, #location_nursing_stations').on('click', function(){
    if($('#location_changing_stations').is(':checked') || $('#location_nursing_stations').is(':checked')) {
      $('#checkin-submit-btn').toggle(true);
    } else {
      $('#checkin-submit-btn').toggle(false);
    };
  });
  $('body').on('click','.result-row', function(){
    $('.new_location').show()
    
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
  $(".new_location").on('submit', function(event){
      console.log(data);
      for(var key in data){
        $('<input />').attr('type', 'hidden')
        .attr('name', "location[" + key + "]")
        .attr('value', data[key])
        .prependTo('.new_location');
      };
  });
});

var map;
var infowindow;
var lat;
var lng;


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
    radius: 100,
    types: ['amusement_park','aquarium','art_gallery','bicycle_store','book_store','bowling_alley','cafe','campground','casino','food','gym','library','lodging','movie_theater','museum','park','restaurant','rv_park','shopping_mall','spa','stadium','zoo','store','gas_station','grocery_or_supermarket','laundry','parking','subway_station','train_station']
  };
  infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);
  service.nearbySearch(request, callback);
}

function callback(results, status) {
  var ary = [];
  if (status == google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      ary.push({name: results[i].name, vicinity: results[i].vicinity, placeID: results[i].place_id});
      // createMarker(results[i]);
      // $('#locals_list').append("<li>" + results[i].name + " " + results[i].vicinity + "</li>")
    }
      var context = {locations:ary};//{name: results[i].name, vicinity: results[i].vicinity};
      var source = $("#google-location-template").html();
      var template = Handlebars.compile(source);
      // var html = template(context);
      $('#locals_list').append(template(context))
  console.log(results)
  console.log(results[1])
  console.log(results[1].name)
  console.log(results[1].vicinity)

  }
}

// function createMarker(place) {
//   var placeLoc = place.geometry.location;
//   var marker = new google.maps.Marker({
//     map: map,
//     position: place.geometry.location
//   });

//   google.maps.event.addListener(marker, 'click', function() {
//     infowindow.setContent(place.name);
//     infowindow.open(map, this);
//   });
// }

google.maps.event.addDomListener(window, 'load', initialize);


$(document).ready(function(){
  $('body').on('click','.result-row', function(){
    $('.result-row').removeClass('selected-row');
    $(event.target).addClass('selected-row');
    console.log('shit', event.target);
      var placeID = event.target.dataset.place_id
      var request = {
      placeId: placeID
      };

      service = new google.maps.places.PlacesService(map);
      service.getDetails(request, callback);

      function callback(place, status) {
        console.log(place);
        if (status == google.maps.places.PlacesServiceStatus.OK) {
          // createMarker(place);
        }
      }
  });
});


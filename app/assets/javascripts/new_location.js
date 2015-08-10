var newPlace
var locationData

function auto() {
  var input = document.getElementById('searchTextField');

  var autocomplete = new google.maps.places.Autocomplete(input);
  google.maps.event.addListener(autocomplete, 'place_changed', function () {
      $('#create-submit-btn').toggle(true);
      newPlace = autocomplete.getPlace();
        locationData = {name: newPlace.name, place_id: newPlace.place_id, lng: newPlace.geometry.location.K, lat: newPlace.geometry.location.G, formatted_address: newPlace.formatted_address, formatted_phone_number: newPlace.formatted_phone_number}
        console.log(locationData);
        $('#search-data-display').text(newPlace.formatted_address)
        });
      $("#new_location").on('submit', function(event){
        event.preventDefault();
        for(var key in locationData){
          $('<input />').attr('type', 'hidden')
          .attr('name', "location[" + key + "]")
          .attr('value', locationData[key])
          .prependTo('#new_location');
        };
      });

  };

google.maps.event.addDomListener(window, 'load', auto)


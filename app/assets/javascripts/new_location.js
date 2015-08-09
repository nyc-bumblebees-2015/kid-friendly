function auto() {
  var input = document.getElementById('searchTextField');

  var autocomplete = new google.maps.places.Autocomplete(input);
  google.maps.event.addListener(autocomplete, 'place_changed', function () {
      var place = autocomplete.getPlace();
        console.log(place);
        });
  };
google.maps.event.addDomListener(window, 'load', auto)



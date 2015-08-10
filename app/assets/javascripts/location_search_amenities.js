$(document).ready( function(){

  $('#cribs').on('click', function(event){
    event.preventDefault();
    event.stopPropagation();
    var route = getBaseUrl() + '/find_amenities/' + 'cribs' + '?lat=' + window.lat + '\&lng=' + window.lng;
    console.log(route);
    window.location.href = route;
  });

  $('#changing_stations').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'changing_stations' + '?lat=' + window.lat + '\&lng=' + window.lng;
    window.location.href = route;
  });

  $('#high_chairs').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'high_chairs' + '?lat=' + window.lat + '\&lng=' + window.lng;
    window.location.href = route;
  });

  $('#family_restrooms').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'family_restrooms' + '?lat=' + window.lat + '\&lng=' + window.lng;
    window.location.href = route;
  });

  $('#restrooms').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'restrooms' + '?lat=' + window.lat + '\&lng=' + window.lng;
    window.location.href = route;
  });

  $('#nursing_stations').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'nursing_stations' + '?lat=' + window.lat + '\&lng=' + window.lng;
    window.location.href = route;
  });

  $('#water_fountains').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'water_fountains' + '?lat=' + window.lat + '\&lng=' + window.lng;
    window.location.href = route;
  });

  function getBaseUrl() {
    var host = window.location.host
    var protocol = location.protocol
    var baseUrl = protocol + "//" + host
    return baseUrl;
  };

})

var LocationSearch = {};

// Model
LocationSearch.Models = (function(){
  var Location = function LocationCreate(data){
    data = data || {};
    for (var i in data) {
      this[i] = data[i]
    };
    this.created_at = new Date(data.created_at);
    this.updated_at = new Date(data.updated_at);
  };

  Location.nameSearch = function(name, prox){
    url = '/locations/search/' + encodeURIComponent(name) + '?prox=' + prox + '\&lat=' + sessionStorage.getItem('lat') + '\&lng=' + sessionStorage.getItem('lng');
    var deferred = $.ajax({url: url})
    .then(function(response){
      return response.map(function(ele){
        return new Location(ele);
      });
    });
    return deferred;
  };

  var retval = { Location: Location };
  return retval;

})();

LocationSearch.BrowserLocation = (function(){

  Location.get = function() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position){
          sessionStorage.setItem('lat', position.coords.latitude);
          sessionStorage.setItem('lng', position.coords.longitude);
        });
    } else {
        alert("Geolocation is not supported by this browser. Please turn it on to ensure better search results");
    }
  };

  var retval = { Location: Location };
  return retval;
})();


// Controller
LocationSearch.Controller = function(){

  LocationSearch.Controller.prototype.performNameSearch = function(searchText, distance) {
    LocationSearch.Models.Location.nameSearch(searchText, distance)
    .then(function(results){
      var resultsAry = [];
      // this.view.renderSeachResults(results)
      for (var i = 0; i < results.length; i++){
        resultsAry.push({name: results[i].name, formatted_address: results[i].formatted_address, id: results[i].id})
      }
      var context = {locations:resultsAry};
      var source = $("#search-results-template").html();
      var template = Handlebars.compile(source);
      $('#search-results-list').html(template(context))
    }.bind(this))
    .fail(function(req, stat, text){
      alert(searchText + ': ' + text);
    });
  };

};

// View
LocationSearch.View = function(controller){
  this.controller = controller;

  // LocationSearch.View.prototype.renderSeachResults = function(locations) {
  //   var html = '';
  //   locations.forEach(function(location) { html += this.renderLocation(location) }.bind(this))
  //   $('#search-results-container').html(html);
  // };

  // LocationSearch.View.prototype.renderLocation = function(location) {
  //   var html = '';
  //   html += '<div>';
  //   html +=  '<a href=/locations/' + location.id + '>' + location.name + '</a><br>';
  //   html += location.formatted_address;
  //   html += '</div>';
  //   return html

  // };

  $('#search-form').on('submit', function(event){
    event.preventDefault();
    var searchName = $('#search').val();
    var prox = $('#proximity').val();
    this.controller.performNameSearch(searchName, prox);
  }.bind(this));

  function getBaseUrl() {
    var host = window.location.host
    var protocol = location.protocol
    var baseUrl = protocol + "//" + host
    return baseUrl;
  };

  function getLat() {
    var lat = sessionStorage.getItem('lat');
    return lat;
  };

  function getLng() {
    var lng = sessionStorage.getItem('lng');
    return lng;
  };

  $('#changing').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'changing_stations' + '?lat=' + getLat() + '\&lng=' + getLng();
    window.location.href = route;
  });

  $('#nursing').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'nursing_stations' + '?lat=' + getLat() + '\&lng=' + getLng();
    window.location.href = route;
  });

    $('#cribs').on('click', function(event){
    event.preventDefault();
    event.stopPropagation();
    var route = getBaseUrl() + '/find_amenities/' + 'cribs' + '?lat=' + getLat() + '\&lng=' + getLng();
    window.location.href = route;
  });

  $('#changing_stations').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'changing_stations' + '?lat=' + getLat() + '\&lng=' + getLng();
    window.location.href = route;
  });

  $('#high_chairs').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'high_chairs' + '?lat=' + getLat() + '\&lng=' + getLng();
    window.location.href = route;
  });

  $('#family_restrooms').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'family_restrooms' + '?lat=' + getLat() + '\&lng=' + getLng();
    window.location.href = route;
  });

  $('#restrooms').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'restrooms' + '?lat=' + getLat() + '\&lng=' + getLng();
    window.location.href = route;
  });

  $('#nursing_stations').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'nursing_stations' + '?lat=' + getLat() + '\&lng=' + getLng();
    window.location.href = route;
  });

  $('#water_fountains').on('click', function(event){
    event.preventDefault();
    var route = getBaseUrl() + '/find_amenities/' + 'water_fountains' + '?lat=' + getLat() + '\&lng=' + getLng();
    window.location.href = route;
  });

};

$(document).on('ready', function(){
  var controller = new LocationSearch.Controller();
  var view = new LocationSearch.View(controller);
  controller.view = view;
  if ( sessionStorage.getItem('lat') && sessionStorage.getItem('lng') ) {
    console.log('lat and lng set')
  } else {
    LocationSearch.BrowserLocation.Location.get();
  };

});

var LocationSearch = {};

// Model
LocationSearch.Models = (function(){
  var Location = function LocationCreate(data) {
    data = data || {};
    for (var i in data) {
      this[i] = data[i]
    };
    this.created_at = new Date(data.created_at);
    this.updated_at = new Date(data.updated_at);
  };

  Location.search = function(name, prox) {
    url = '/locations/search/' + encodeURIComponent(name) + '?prox=' + prox + '\&lat=' + window.lat + '\&lng=' + window.lng;
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
    // debugger;
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position){
          window.lat = position.coords.latitude;
          window.lng = position.coords.longitude;
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

  LocationSearch.Controller.prototype.performSearch = function(searchText, distance) {
    LocationSearch.Models.Location.search(searchText, distance)
    .then(function(results){
      console.log('yay', results);
      this.view.renderSeachResults(results)
    }.bind(this))
    .fail(function(req, stat, text){
      alert(searchText + ': ' + text);
    });
  };

};

// View
LocationSearch.View = function(controller){
  this.controller = controller;

  LocationSearch.View.prototype.renderSeachResults = function(locations) {
    var html = '';
    locations.forEach(function(location) { html += this.renderLocation(location) }.bind(this))
    $('#search-results-container').html(html);
  };

  LocationSearch.View.prototype.renderLocation = function(location) {
    var html = '';
    html += '<div>';
    html += location.name + '<br>';
    html += location.formatted_address;
    html += '</div>';
    return html
  };

  $('#search-form').on('submit', function(event){
    event.preventDefault();
    var searchName = $('#search').val();
    var prox = $('select').val();
    this.controller.performSearch(searchName, prox);
  }.bind(this));

};


$(document).ready(function(){
  var controller = new LocationSearch.Controller();
  var view = new LocationSearch.View(controller);
  controller.view = view;
  LocationSearch.BrowserLocation.Location.get();
});

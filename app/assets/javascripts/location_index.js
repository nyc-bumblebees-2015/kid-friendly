var LocationSearch = {}

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

  Location.search = function(name) {
    debugger;
    url = 'locations/search/' + encodeURIComponent(name);
    var deferred = $.ajax({url: url})
    .then(function(response){
      return response.map(function(ele){ return new Location(ele)});
    });
    return deferred;
  };


})();

// Controller

LocationSearch.Controller = function(){

  LocationSearch.Controller.prototype.performSearch = function(searchText) {
    debugger;
    LocationSearch.Models.Location.search(searchText)
    .then(function(results){
      console.log('yay', results)
    }.bind(this))
    .fail(function(req, stat, text){
      alert(searchText + ': ' + text)
    });
  };

};

// View
LocationSearch.View = function(controller){
  this.controller = controller;

  $('#search-form').on('submit', function(event){
    event.preventDefault();
    var searchName = $(this).find('#search').val();
    this.controller.performSearch(searchName);
  }.bind(this));

};




$(document).ready(function(){

  var controller = new LocationSearch.Controller();
  var view = new LocationSearch.View(controller);
  // $('#search-form').on('submit', function(event){
  //   event.preventDefault();
  //   var name = $(this).find('#search').val();
  //   debugger;
  //   $.ajax({
  //     url: 'locations/search/' + name,
  //     method: 'GET',
  //     dataType: 'json'
  //   }).success(function(response){
  //     console.log('yay', response)
  //   }).fail(function(event){
  //     console.log(': (', response)
  //   });
  // });
});






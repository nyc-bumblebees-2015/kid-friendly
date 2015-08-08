$(document).ready(function(){
  $('.helpful').on('submit',function(event){
    event.preventDefault();
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize(),
      dataType: 'json'
    }).done(function(response){
      console.log("successful");
      var points = $(event.target).find('.helpful_points');
    }).fail(function(error){
      console.log('failed');
    });
  });
});
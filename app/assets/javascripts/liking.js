$(document).on('ready', function(){
  $('.helpful').on('submit',function(event){
    event.preventDefault();
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize(),
      dataType: 'json'
    }).done(function(response){
      console.log("successful");
      var likes = $(event.target).parent().parent().find('.helpful_points');
      var people = $(event.target).parent().parent().find('.helped');
      likes.html(response.likes);
      if (response.likes == 1){
        people.html("person");
      } else {
        people.html("people");
      }
    }).fail(function(error){
      console.log('failed');
    });
  });
});

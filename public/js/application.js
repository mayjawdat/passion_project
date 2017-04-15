$(document).ready(function() {
 returnCatHandler();
 $('.carousel').carousel();
});

var returnCatHandler = function(){
  $("#cat-list").on("submit", ".cat_return",  function(event){
    event.preventDefault();

    // set variables
    var returnEvent = $(this)
    var returnUrl = returnEvent.attr("action")

    // make ajax call
    var request = $.ajax({
      url: returnUrl,
      type: "delete"
    })

    // .done function
    request.done(function(){
      returnEvent.parent().parent().remove()
    })

    // .fail function
    request.fail(function(response){
      console.log(response);
      console.log("YOU HAVE FAILED")
    })

  })
}

// Next slide
$('.carousel').carousel('next');
$('.carousel').carousel('next', 3); // Move next n times.
// Previous slide
$('.carousel').carousel('prev');
$('.carousel').carousel('prev', 4); // Move prev n times.
// Set to nth slide
$('.carousel').carousel('set', 4);
      

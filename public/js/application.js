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
// Previous slide
$('.carousel').carousel('prev');


      

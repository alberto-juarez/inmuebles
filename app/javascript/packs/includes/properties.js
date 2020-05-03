$(function(){
  $("#toggleDetails").on("click",function() {
    var details = $(".prop-details");
    details.toggleClass("open");
    if(details.hasClass("open")){
      $(this).text("Ver menos");

    } else {
      $(this).text("Ver más");
    }
  })
});

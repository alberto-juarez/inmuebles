$(function(){
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {

    var href = $(e.target).attr('href');
    var $curr = $(".process-model  a[href='" + href + "']").parent();

    $('.process-model li').removeClass();

    $curr.addClass("active");
    $curr.prevAll().addClass("visited");
  })

  $("#show-tel").on("click",function() {
    var $this = $(this);
    $this.find("span").text($this.data("telephone"));
  });

  $("#toggleDetails").on("click",function(e) {
    e.preventDefault();
    var $this = $(this);
    var details = $(".prop-details");
    details.toggleClass("open");
    // console.log($this.data("less"));
    // console.log($this.data("more"));
    if(details.hasClass("open")){
      // $(this).text("Ver menos");
      $this.find("span").text($this.data("less"));

    } else {
      $this.find("span").text($this.data("more"));
      // $(this).text("Ver más");
    }
  })

  $("#contact-modal").on("show.bs.modal",function(event){
    var button = $(event.relatedTarget);
    var modal = $(this);
  });
});

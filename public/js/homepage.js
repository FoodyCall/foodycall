$(function() {
  $( "div.events" ).on( "click", ".event-card", function(event) {
    event.preventDefault();
    $('#eventModal').modal('show');
    $(".modal-title").text($(this).find("div.caption h3").text());
    $(".modal-time").text($(this).find("div.caption .time").text());
    $(".modal-date").text($(this).find("div.caption .date").text());
    $(".modal-location").text($(this).find("div.caption .location").text());
    $(".modal-host-age").before($(this).find("div.caption .host-name").text());
    $(".modal-host-img").attr("src",$(this).find(".host-img img").attr("src"));
    console.log(this);
    $(".modal-host-stars").html($(this).find(".stars").html());
  });

  $('[data-toggle="popover"]').popover();

  $(".modal-role a").on("click",function(event){
    event.preventDefault();
    var index = $(this).closest("div").index();
    percentage = "5.5%";
    switch (index) {
      case 1:
        percentage = "18.5%";
        break;
      case 2:
        percentage = "31%";
        break;
      case 3:
        percentage = "44%";
        break;
      case 4:
          percentage = "57%";
          break;
      default:
    }
    $(".popover .arrow").css("left", percentage);
    
  })

});

$(function() {
  $( "div.events" ).on( "click", ".event-card", function(event) {
    event.preventDefault();
    $('#eventModal').modal('show');
    $(".modal-title").text($(this).find("div.caption .event-title").text());
    $(".modal-time").text($(this).find("div.caption .time").text());
    $(".modal-date").text($(this).find("div.caption .date").text());
    $(".modal-location").text($(this).find("div.caption .location").text());
    $(".modal-joined").text($(this).find("div.caption .event-joined").text());
    $(".modal-total").text($(this).find("div.caption .event-total").text());

    var age = $(".modal-host-name").children();
    $(".modal-host-name").text($(this).find("div.caption .host-name-full").text());
    $(".modal-host-name").append(age);
    $(".modal-host-age").text(' (' +$(this).find("div.caption .host-age").text()+')');
    $(".modal-host-img").attr("src",$(this).find(".host-img img").attr("src"));
    console.log(this);
    $(".modal-host-stars").html($(this).find(".stars").html());

    $(".modal-location").text($(this).find("div.caption .location").text());
    $(".modal-role .role-quantity.shopper").text('(0/'+$(this).find("div.caption .event-shopper").text()+')');
    $(".modal-role .role-quantity.chef").text('(0/'+$(this).find("div.caption .event-chef").text()+')');
    $(".modal-role .role-quantity.helper").text('(0/'+$(this).find("div.caption .event-helper").text()+')');
    $(".modal-role .role-quantity.guest").text('(0/'+$(this).find("div.caption .event-guest").text()+')');
    $(".modal-role .role-quantity.cleaner").text('(0/'+$(this).find("div.caption .event-cleaner").text()+')');

    //Dish Elements
    var menus = $(this).find(".event-menus").html();
    $(".dishes").html(menus);
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

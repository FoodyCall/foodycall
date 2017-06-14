$(function() {
  $( "div.events" ).on( "click", ".event-card", function(event) {
    event.preventDefault();
    $('#eventModal').modal('show');
    $(".modal-title").text($(this).find("div.caption .event-title").text());

    $(".modal-time").text($(this).find("div.caption .time").text());
    $(".modal-date").text($(this).find("div.caption .date").text());
    $(".modal-location").text($(this).find("div.caption .location").text());
    $(".modal-approved").text($(this).find("div.caption .event-approved").text());
    $(".modal-total").text($(this).find("div.caption .event-total").text());
    $("#event-modal-id").text($(this).find("div.caption .event-id").text());
      $("#event-modal-id").val($(this).find("div.caption .event-id").text());

    var age = $("#eventModal .modal-host-name").children();
    $(".modal-host-name").text($(this).find("div.caption .host-name-full").text());
    $("#eventModal .modal-host-name").append(age);
    $(".modal-host-age").text(' (' +$(this).find("div.caption .host-age").text()+')');
    $(".modal-host-img").attr("src",$(this).find(".host-img img").attr("src"));
    console.log(this);
    $(".modal-host-stars").html($(this).find(".stars").html());

    $(".modal-location").text($(this).find("div.caption .location").text());
    $(".modal-role .role-quantity.shopper").text('('+$(this).find("div.caption .event-shopper-approved").text()+'/'+$(this).find("div.caption .event-shopper").text()+')');
    $(".modal-role .role-quantity.chef").text('('+$(this).find("div.caption .event-chef-approved").text()+'/'+$(this).find("div.caption .event-chef").text()+')');
    $(".modal-role .role-quantity.helper").text('('+$(this).find("div.caption .event-helper-approved").text()+'/'+$(this).find("div.caption .event-helper").text()+')');
    $(".modal-role .role-quantity.guest").text('('+$(this).find("div.caption .event-guest-approved").text()+'/'+$(this).find("div.caption .event-guest").text()+')');
    $(".modal-role .role-quantity.cleaner").text('('+$(this).find("div.caption .event-cleaner-approved").text()+'/'+$(this).find("div.caption .event-cleaner").text()+')');

    //Dish Elements
    var menus = $(this).find(".event-menus").html();
    $(".dishes").html(menus);

    //SHow Participants
    console.log($(this).find(".event-participants-chef").html());
    role = '.event-participants-shopper-' + $('#event-modal-id').text();
    $(".popover-content").html($(role).html());

    //Return arrow to first place
    $(".popover .arrow").css("left", "5.5%");

    //Check if user already joined event and disable button
    check = $(this).find("div.caption .user-joined").text();
    if (check=='yes'){
        $("#join-event").prop('disabled', true);
    }else{
        $("#join-event").prop('disabled', false);
    }


  });

  $('[data-toggle="popover"]').popover();

  $(".modal-role a").on("click",function(event){
    event.preventDefault();
    var index = $(this).closest("div").index();
    percentage = "5.5%";
    role = ".event-participants-shopper";
    switch (index) {
      case 1:
        percentage = "18.5%";
        role = ".event-participants-chef";
        break;
      case 2:
        percentage = "31%";
        role = ".event-participants-helper";
        break;
      case 3:
        percentage = "44%";
        role = ".event-participants-guest";
        break;
      case 4:
          percentage = "57%";
          role = ".event-participants-cleaner";
          break;
      default:
    }
    $(".popover .arrow").css("left", percentage);
    role = role + '-' + $('#event-modal-id').text();
    $(".popover-content").html($(role).html());
  })

  $( "#join-event" ).on( "click", function(event) {
    event.preventDefault();
    $('#eventModal').modal('hide');
    $('#joinEventModal').modal('show');

    //Reset form
    $('#joinEventModal form').find("input[type=text], textarea").val("");
    $('#joinEventModal form').find("input[type='checkbox']").removeAttr('checked');
    //Disable checkbox of roles full
    $('#joinEventModal .role-quantity').each(function(){
      value = $(this).text();
      values = value.replace('(','').replace(')','').split('/');
      if (values[1] == 0 || values[0]>= values[1]){
        //disable checkbox
        var el = $(this);
        $(this).siblings("input[type='checkbox']").attr('disabled',true);
        //change roles icon to gray
        var icon = $(this).siblings("span")[0];
        var src = $(icon).find('img').attr('src');
        if (src.indexOf("gray") == -1){
          $(icon).find('img').attr('src',src.replace('.png','-gray.png'));
          $(icon).addClass("role-gray");
        }
      }else{
        $(this).siblings("input[type='checkbox']").attr('disabled',false);
        //change roles icon to not gray
        var icon = $(this).siblings("span")[0];
        var src = $(icon).find('img').attr('src');
        if (src.indexOf("gray") != -1){
          $(icon).find('img').attr('src',src.replace('-gray.png','.png'));
          $(icon).removeClass("role-gray");
        }
      }
    });

  })

  $('#joinEventModal input:checkbox').on('click', function(e) {
    e.stopImmediatePropagation();
    var checked = (e.currentTarget.checked) ? false : true;
    e.currentTarget.checked=(checked) ? false : checked.toString();
})

});

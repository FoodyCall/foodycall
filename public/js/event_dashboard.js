$(function() {
  $(".input-post input").on("focus",function() {
    $(".input-post").attr("style","outline: -webkit-focus-ring-color auto 5px;")
  }).on("focusout",function(){
    $(".input-post").attr("style", " ");
  });


  $(".input-post input").keypress(function(e) {
    if(e.which == 13) {
      console.log('click')
      $.post("/post",
        {
            event_id: $(".event-id").first().text(),
            post: $("#txt_post").val()
        },
        function(data, status){
            alert("Post Send");
            location.reload();
        });


    }
  });

  $(".btn-accept").on('click',function(e) {
    $.post("/approve",
      {
          event_id: $(".event-id").first().text(),
          user_id: $(".request-user-id").first().text()
      },
      function(data, status){
          alert("Request Approved. Now the user can access to the discussion board and event details");
          location.reload();
      });
  });


});

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
            alert("PostSaved:" + data + status);

            //Add now card
            html="<div class='post'>"
            html="  <div class='usr-post'>"
            html="    <img class='img-circle' src='"+$(".img-circle")[0].src+"' class='usr-post-img' alt=''>"
            html="    <p class='usr-post-name'>"+$(".img-circle")[0].src+"<span class='usr-post-age'>(<%= post.user.age%>)</span></p>"
            html="  </div>"
            html="  <div class='usr-post-text-div'>"
            html="    <p class='usr-post-text'><%= post.post%></p>"
            html="  </div>"
            html="</div>"
        });


    }
  });

});

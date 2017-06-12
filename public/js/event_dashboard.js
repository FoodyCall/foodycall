$(function() {
  $(".input-post input").on("focus",function() {
    $(".input-post").attr("style","outline: -webkit-focus-ring-color auto 5px;")
  }).on("focusout",function(){
    $(".input-post").attr("style", " ");
  });

  
  $(".input-post input").keypress(function(e) {
    if(e.which == 13) {
        alert('Post');
    }
  });

});

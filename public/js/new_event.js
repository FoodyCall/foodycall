$(function() {
  $('.spinner .btn:first-of-type').on('click', function() {
    var value = parseInt($(this).closest(".spinner").find("input").val(), 10);
    var total = parseInt($(".my-role .total").text(),10);

    $(this).closest(".spinner").find("input").val( value + 1);
    $(".my-role .total").text(total + 1);
  });
  $('.spinner .btn:last-of-type').on('click', function() {
    var value = parseInt($(this).closest(".spinner").find("input").val(), 10);
    if (value > 0) {
      var total = parseInt($(".my-role .total").text(),10);
      $(this).closest(".spinner").find("input").val( value - 1);
      $(".my-role .total").text(total - 1);
    }
  });

  $(".my-role .dropdown-menu a").on("click",function(event){
    event.preventDefault();
    var role = $(this).text();
    $("#myRoleMenu").html(role + " <span class=\"caret\"></span>");
  });

  $(".new-dish-btn a").on("click", function(event) {
    event.preventDefault();
    $('#newDish').modal('show');
  });

  
});

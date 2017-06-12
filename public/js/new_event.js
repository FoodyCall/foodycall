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

  $(".upload-btn").on("click",function() {
    $("#dishImg").click();
  });

  $(".delete-dish").on("click",function(event){
    event.preventDefault();
    $(this).closest(".col-lg-2").remove();
  });

  $(".edit-dish").on("click",function(event){
    event.preventDefault();
    //$("#newDish #dishName").val($(this).closest(".thumbnail").find(".dish-name").text());
    $("#newDish").modal("show");
  });

  $('#preview').css('display','none');
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
            $('#preview').css('display','');
            $('#preview').attr('src', e.target.result);
          }

          reader.readAsDataURL(input.files[0]);
      }
  }

  $("#dishImg").change(function(){
      readURL(this);
  });


});

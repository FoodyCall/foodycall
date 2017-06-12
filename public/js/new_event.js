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
    $("#host-role").attr('value',role);
  });

  $(".new-dish-btn a").on("click", function(event) {
    event.preventDefault();
    $('#newDish').modal('show');
  });
  $(".event-img-btn a").on("click", function(event) {
    event.preventDefault();
    $("#eventImg").click();
  });

  $(".upload-btn").on("click",function() {
    $("#dishImg").click();
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

  function createDishCard(obj){
    html = "";
    html+="<div class='col-lg-2 card-padding'>"
    html+="  <div class='thumbnail'>"
    html+="    <input type='hidden' name='dishes[]' class='dishes-array' />"
    html+="    <img class='center-cropped' src='data:image/"+obj.img.fileType+";base64," + obj.img.base64+"'>"
    html+="    <div class='caption>"
    html+="      <p class'dish-name'>"+obj.name+"</p>"
    html+="      <p><a href='#' class='btn btn-primary hidden' role='button'><span class='glyphicon glyphicon-edit edit-dish'></span></a> <a href='#' class='btn btn-default delete-dish' role='button'><span class='glyphicon glyphicon-trash'></span></a></p>"
    html+="    </div>"
    html+="  </div>"
    html+="</div>"

    //Adde json object-fit
    string = JSON.stringify(obj);
    //Add to DOM
    $(html).insertBefore("#btnOpenNewDishModal");
    //Add json to input hidden
    $(".dishes-array").last().val(string);

    //Clean
    $('#newDish-name').val('');
    $('input[name=newDish-type]:checked').removeAttr("checked");
    $("#newDish-recipe").val('');
    $('#preview').css('display','none');

    $('#newDish').modal('hide');

    //Add listener
    $(".delete-dish").on("click",function(event){
      event.preventDefault();
      $(this).parents(".col-lg-2").remove();
    });
  }
  //New Dish Modal Handler
  $("#newDish-btn").on("click",function(event){
    //Capture information
    // From <input> node
    var elm = document.getElementById('dishImg'),
    img = elm.files[0],
    fileName = img.name, // not path
    fileSize = img.size; // bytes
    fileType = fileName.split('.').pop();

    // By Parsing File
    var reader = new FileReader(),
        binary, base64;
    reader.addEventListener('loadend', function () {
        binary = reader.result; // binary data (stored as string), unsafe for most actions
        base64 = btoa(binary); // base64 data, safer but takes up more memory
        var obj = {
          name: $('#newDish-name').val(),
          type: $('input[name=newDish-type]:checked').val(),
          recipe: $("#newDish-recipe").val(),
          img: {
            fileName: fileName,
            fileType: fileType,
            fileSize: fileSize,
            base64: base64
          }
        }

        createDishCard(obj);

    }, false);
    reader.readAsBinaryString(img);




    console.log()




  });

});

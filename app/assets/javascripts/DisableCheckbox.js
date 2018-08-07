$(function(){
  //Add onclick function
  $("#rider_RRCW").click(function() {
    if ($("#rider_RRCW").is(":checked")){
      $("#btnSubmit").removeClass("disabled");
    }else{
      $("#btnSubmit").addClass("disabled");
    }
  });
});

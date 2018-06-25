# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(function ($) {
  var tshirt = $("#rider_passengers_attributes_0_tshirt");

  field.hide();

  $("#rider_passengers_attributes_0_age").change(function(){
    var selectAge = $("#rider_passengers_attributes_0_age option:selected").val();

    if ($(this).val()) == 0{
      $("#tshirt").hide();
    }else if ($(this).val()) == 1{
        $("#tshirt").show();
    }else{
      $("#tshirt").hide();
    }
  })
});

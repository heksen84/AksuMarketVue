import $ from "jquery";

// загрузить модели автомобилей
function loadCarsModels(idCarMark) {
  $("#model").empty().append("<option value=all>Все модели</option>");
  $.ajax({
    url: "/api/getCarsModels",
    type: "GET",
    data: {"_token": $('meta[name="csrf-token"]').attr('content'), "mark_id": idCarMark},
    success: function (response) {                  
      $.each(response, function(index, item) {
        $("#model").append("<option value="+item.id_car_model+">"+item.name+"</option>");
      });   
    }    
  });
}

// загрузить марки автомобилей
function loadCarsMarks() {
  $("#mark").empty().append("<option value=all>Все марки</option>");
  $.ajax({
    url: "/api/getCarsMarks",
    type: "GET",
    data: {"_token": $('meta[name="csrf-token"]').attr('content')},
    success: function (response) {                                    
      $.each(response, function(index, item) {
        $("#mark").append("<option value="+item.id_car_mark+">"+item.name+"</option>");
      });
      $( "#mark" ).change(function(item) { 
        loadCarsModels($(this).children("option:selected").val()); 
      }).change();
    }
  });
}

// загрузить данные автомобилей
function initCars() {
  
  if (window.mark) 
    $("#mark").val(window.mark);
  
    if (window.model) 
      $("#model").val(window.model);

      loadCarsMarks();
}


function initFilters() {

  let buttonFiltersDefaultText = "скрыть фильтры";

  $("#filters_button").click(function(item) { 
    
    if ($("#filters_button").text() == buttonFiltersDefaultText) {      
      $("#filters").hide();
      $("#filters_button").text("отфильтровать");
      localStorage.setItem("show_filters", "false");      
    }
    else {      
      $("#filters").show()
      $("#filters_button").text(buttonFiltersDefaultText);
      localStorage.setItem("show_filters", "true");
    }
  });

}

// html готов
$( document ).ready(function() {
  
  initCars();    
  initFilters();      

  if (localStorage.getItem("show_filters")=="true") {   
    $("#filters_button").trigger("click");
  }

});
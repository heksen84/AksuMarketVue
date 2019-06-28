require('./bootstrap');

import data from './data';
import Vue from 'vue';
import $ from "jquery";

//import popperjs from "popper.js";
import bootstrap from "bootstrap";
import { get } from './helpers/api' // axios

// экземляр приложения vue
export default new Vue
({
  el: '#app',
  data: data,
  delimiters: ['${', '}'], // для разрешения конфликта c переменными php
  components: {
    //popperjs,
    bootstrap
  },

  // Компонент создан
  created() { 
    $("#locationButton").show();    
  },

  // Методы
  methods: {

	showLocationWindow() {
    $("#locationModal").modal("show");
  },
  
  closeLocationWindow() {
    this.regions=true;
    this.places=false;
    $("#locationModal").modal("hide");    
  },
  
  // Выбор региона
  showPlacesByRegion(e, regionId) {            
    
    e.preventDefault();

    // Получить города / сёлы
    get("getPlaces?region_id="+regionId).then((res) => {    
      this.placesList=res.data;
      this.regionUrl=e.target.pathname;
      this.regions=false;
      this.places=true;
    }).catch((err) => { console.log(err) });    
  },

  // Выбор расположения
  selectPlace(e, placeName, placeUrl) {      

    e.preventDefault();
    
    this.locationName=placeName;
    this.closeLocationWindow();    

    // Сбрасываю на значения по умолчанию
    $( ".url" ).each(function( index ) {      
      $(this).attr("href", $(this).data("default-url"))
    });

    var allUrlsCategories = $(".url").attr("href");
    
    $(".url").attr("href", this.regionUrl+"/"+placeUrl+allUrlsCategories); // склеиваю расположение 
  }
}
  
});
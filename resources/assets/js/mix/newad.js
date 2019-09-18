"use strict";

require('./bootstrap');

import Vue from 'vue';
import Vuex from 'vuex';
import newad from './views/newad.vue';

Vue.use(Vuex);

// --------------------------------------
// Хранилище
// --------------------------------------
const store = new Vuex.Store({

  state: {          
    price: "", 
    required_info: false,
    info_label_description: "",
    placeholder_info_text:  "",      
    show_final_fields: false,
    show_common_transport: false,
    deal_selected: false,    
    str_realestate_area_label_text: "",
    phones: 0,
    phonesArr: []
  },

  mutations: {

    AddPhoneNumber( state ) {      
      state.phones++;      
      state.phonesArr.push("")
      console.log(state.phonesArr)
    },

    RemovePhoneNumber( state, index ) {      
      state.phonesArr.splice(index, 1)
      console.log(state.phonesArr)
      state.phones-- 
    },

    SetPhoneNumber( state, index, text ) {      
      console.log("INDEX : "+index)      
      console.log("VALUE : "+text)     
      //state.phonesArr[index] = value
      state.phonesArr.splice(index, 1, "value");
      console.log(state.phonesArr)      
    },

    SetDealSelected( state, value ) {
      state.deal_selected=value;
    },

    // установить заголовок для площади в недвижимости
    SetRealEstateAreaLabelText( state, text ) {
      text=="default"?state.str_realestate_area_label_text = "Площадь (кв.м.):":state.str_realestate_area_label_text = text;
    },

    // установить заголовок доп. информации / текста объявления
    SetInfoLabelDescription( state, text ) {
      text=="default"?state.info_label_description = "Текст объявления":state.info_label_description = text;
    },

    // установить текст подсказки в поле описание
    SetPlaceholderInfoText(state, text) {
      text=="default"?state.placeholder_info_text = "Введите текст объявления":state.placeholder_info_text = text;
    },

    // сбросить содержимое поля
    ResetField(state, field_name) {
      switch(field_name) {
        case "price": state.price=""; break;
      }
    },        

    SetRequiredInfo (state, value) {
      state.required_info=value;
    },

    ShowFinalFields (state, value) {
      state.show_final_fields=value;
    },

    ShowCommonTransport (state, value) {
      state.show_common_transport=value;
    }
  }
})

// --------------------------
// экземляр приложения vue
// --------------------------
export default new Vue ({
  
  data () {     
    return { 
      advert_data: {} // глобальный объект объявления
    }
  },
  store,
  el: '#app',
  components: { newad }

});
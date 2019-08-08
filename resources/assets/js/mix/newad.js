"use strict";

require('./bootstrap');

import Vue from 'vue';
import $ from "jquery";
import bootstrap from "bootstrap";
import { get } from '../helpers/api' // axios

var preview_images_array=[];

// ----------------------
// карты
// ----------------------
var mapCoords=[];
var myPlacemark1=null;
var myPlacemark2=null;
var bigmap=null;
var smallmap=null;

/*
------------------------------
 Преобразует строку в массив
------------------------------*/
function str_split(string, length) {
  var chunks, len, pos;    
  string = (string == null) ? "" : string;
  length =  (length == null) ? 1 : length;    
  var chunks = [];
  var pos = 0;
	var len = string.length;	
  while (pos < len) {
    chunks.push(string.slice(pos, pos += length));
  }    
  
  return chunks;
};
	
/*
------------------------------
 Склоняем словоформу
------------------------------*/
function morph(number, titles) {
 var cases = [2, 0, 1, 1, 1, 2];
   return titles[ (number>4 && number<20)? 2 : cases[Math.min(number, 5)] ];
};
	
/*
------------------------------
 Возвращает сумму прописью
------------------------------*/
function number_to_string (num) {
    var def_translite = {
        null: 'ноль',
        a1: ['один','два','три','четыре','пять','шесть','семь','восемь','девять'],
        a2: ['одна','две','три','четыре','пять','шесть','семь','восемь','девять'],
        a10: ['десять','одиннадцать','двенадцать','тринадцать','четырнадцать','пятнадцать','шестнадцать','семнадцать','восемнадцать','девятнадцать'],
        a20: ['двадцать','тридцать','сорок','пятьдесят','шестьдесят','семьдесят','восемьдесят','девяносто'],
        a100: ['сто','двести','триста','четыреста','пятьсот','шестьсот','семьсот','восемьсот','девятьсот'],
						uc: ['тиын', 'тиын', 'тиын'],
						//uc: ['копейка', 'копейки', 'копеек'],
						//ur: ['рубль', 'рубля', 'рублей'],
						ur: ['тенге', 'тенге', 'тенге'],
        u3: ['тысяча', 'тысячи', 'тысяч'],
        u2: ['миллион', 'миллиона', 'миллионов'],
        u1: ['миллиард', 'миллиарда', 'миллиардов'],
    }
		
	var i1, i2, i3, kop, out, rub, v, zeros, _ref, _ref1, _ref2, ax;
    
    _ref = parseFloat(num).toFixed(2).split('.'), rub = _ref[0], kop = _ref[1];
    var leading_zeros = 12 - rub.length;
    if (leading_zeros < 0) {
        return false;
    }
    
    var zeros = [];
    while (leading_zeros--) {
        zeros.push('0');
    }
    rub = zeros.join('') + rub;
    var out = [];
    if (rub > 0) {
        // Разбиваем число по три символа
        _ref1 = str_split(rub, 3);
        for (var i = -1; i < _ref1.length;i++) {
            v = _ref1[i];
            if (!(v > 0)) continue;
            _ref2 = str_split(v, 1), i1 = parseInt(_ref2[0]), i2 = parseInt(_ref2[1]), i3 = parseInt(_ref2[2]);
            out.push(def_translite.a100[i1-1]); // 1xx-9xx
            ax = (i+1 == 3) ? 'a2' : 'a1';
            if (i2 > 1) {
                out.push(def_translite.a20[i2-2] + (i3 > 0 ?  ' ' + def_translite[ax][i3-1] : '')); // 20-99
            } else {
                out.push(i2 > 0 ? def_translite.a10[i3] : def_translite[ax][i3-1]); // 10-19 | 1-9
            }
            
            if (_ref1.length > i+1){
                var name = def_translite['u'+(i+1)];
                out.push(morph(v,name));
            }
        }
    } else {
        out.push(def_translite.null);
    }
    // Дописываем название "рубли"
    out.push(morph(rub, def_translite.ur));
    // Дописываем название "копейка"
    //out.push(kop + ' ' + morph(kop, def_translite.uc));
    
    // Объединяем маcсив в строку, удаляем лишние пробелы и возвращаем результат
    return out.join(' ').replace(RegExp(' {2,}', 'g'), ' ').trimLeft();
};
/*
---------------------------------------------------------
 Инициализация большой карты (карта назначения координат)
---------------------------------------------------------*/
function initMaps() {
	  // координаты по умолчанию для всех карт
	  mapCoords = [51.08, 71.26];
	  bigmap = new ymaps.Map ("bigmap", { center: mapCoords, zoom: 10 });
	  smallmap = new ymaps.Map ("smallmap", { center: mapCoords, zoom: 9 });
	  // запрещаю перемение по мини карте
	  smallmap.behaviors.disable("drag");
	  // включаю скролл на большой карте
	  bigmap.behaviors.enable("scrollZoom");			
	  // формирую метки
	  myPlacemark1 = new ymaps.Placemark(mapCoords);
	  myPlacemark2 = new ymaps.Placemark(mapCoords);
	  // добавляю метки на карты
	  bigmap.geoObjects.add(myPlacemark1);
	  smallmap.geoObjects.add(myPlacemark2);
    bigmap.events.add("click", function (e) {
    mapCoords = e.get("coordPosition");
		myPlacemark1.geometry.setCoordinates(mapCoords);
		myPlacemark2.geometry.setCoordinates(mapCoords);
		smallmap.setCenter(mapCoords, 14, "smallmap");
	});			
}				

// Для заполнения изображений
function forEach(data, callback) { 
	for(var key in data) { 
		if(data.hasOwnProperty(key)) { 
			callback(key, data[key]); 
		} 
	}
}

// --------------------------
// экземляр приложения vue
// --------------------------
export default new Vue ({

  el: "#app",  
  data () {   
    return {
	  category: null
   }
  },

  delimiters: ['${', '}'], // для разрешения конфликта c переменными php
  
  components: {    
    bootstrap
  },

  // -------------------------------
  // Компонент создан
  // -------------------------------
  created() {
    $(".hide").show();
    $(".spinner-grow").hide();
  },
  // --------------------------------------
  // Методы
  // --------------------------------------
  methods: {

   // Вернуться на предыдущую страницу
   closeAndReturn() {
 	  window.history.back();
   }
}
  
});
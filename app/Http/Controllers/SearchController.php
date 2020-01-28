<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Controllers\Controller;
use App\Helpers\Common;
use App\Adverts;
use App\Categories;
use DB;

// Класс поиска по строке
class SearchController extends Controller {

  private $start_record   = 0;
  private $records_limit  = 5; // максимальное число записей при выборке // FIXME: вынести в отдельный модуль
  
  // ----------------------------------------
  // Обработка фильтра
  // ----------------------------------------
  private function getFilterData($request) {    
     
    if (!$request->all())
      return false;
      
  }
  
  // ----------------------------------------
  // Полнотекстовой поиск
  // ----------------------------------------
  public function search(Request $request) {
    
  $items = DB::table("adverts as adv")->select(
    "adv.id", 
    "adv.title", 
    "adv.price",
    DB::raw("concat('".\Common::getImagePath()."', (SELECT name FROM images WHERE images.advert_id=adv.id AND images.type=0 LIMIT 1)) as imageName"
  ))->whereRaw("MATCH (title) AGAINST('".$request->str."' IN BOOLEAN MODE)")->paginate(3)->onEachSide(2);

  \Debugbar::info($items);
    
  return view("results")         
    ->with("title", $request->str)         
    ->with("description", "Результаты поиска по запросу: ".$request->str)         
    ->with("keywords", "поиск, результат, запрос")
    ->with("items", $items)             
    ->with("categoryId", null)
    ->with("subcategoryId", null)
    ->with("region", null)
    ->with("city", null)
    ->with("category", null)
    ->with("subcategory", null)
    ->with("country", null)
    ->with("lang", null)
    ->with("page", 0)
    ->with("startPage", 0)
    ->with("start_price", 0)
    ->with("end_price", 0);
  }

}
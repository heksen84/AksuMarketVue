<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Helpers\Common;
use App\Adverts;
use App\Images;

class DetailsController extends Controller {

    private $raw_engine_type = "CASE 
    WHEN transport.engine_type=0 THEN 'бензин' 
    WHEN transport.engine_type=1 THEN 'дизель' 
    WHEN transport.engine_type=2 THEN 'газ-бензин'
    WHEN transport.engine_type=3 THEN 'газ'
    WHEN transport.engine_type=4 THEN 'гибрид'
    WHEN transport.engine_type=5 THEN 'электричество'
    ELSE '-' 
    END as engine_type";

        // --------------------------------------------------
        // детали объявления
        // --------------------------------------------------
        public function getDetails(Request $request, $id) {

            \Debugbar::info("mykey: ".\Cache::get('mykey'));
                            
            $advertData = Adverts::select("category_id","subcategory_id")->where( "id", $id )->limit(1)->get();
            
            if (count($advertData)==0)
                    return view("errors/404");

            \Debugbar::info("-------------------");
            \Debugbar::info($advertData);
            \Debugbar::info("-------------------");

            // легковое авто
            if ($advertData[0]->category_id == 1 && $advertData[0]->subcategory_id == 1) {  
                    
                \Debugbar::info("легковое авто");

                    $advert = DB::table("adverts as adv")->select(                                 
                            "adv.category_id",
                            "adv.subcategory_id",
                            "adv.startDate",
                            "adv.id", 
                            "adv.title", 
                            "adv.text", 
                            "adv.price", 
                            "adv.phone", 
                            "adv.coord_lat", 
                            "adv.coord_lon", 
                            "transport.type", 
                            "car_mark.name as car_name", 
                            "car_model.name as car_model", 
                            "transport.year", 
                            "transport.mileage",
                            DB::raw("CASE WHEN transport.steering_position=0 THEN 'слева' ELSE 'справа' END as steering_position"),                            
                            DB::raw($this->raw_engine_type),
                            DB::raw("CASE WHEN transport.customs=1 THEN 'да' ELSE 'нет' END as customs"),                                
                            DB::raw("`kz_region`.`name` AS region_name, `kz_city`.`name` AS city_name"),
                            DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"),
                            "categories.name as category_name",
                            "categories.url as category_url",
                            "subcats.name as subcat_name",
                            "subcats.url as subcat_url"
                            )
                            ->join("categories", "adv.category_id" , "=" , "categories.id" )
                            ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                            ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                            ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )                
                            ->join("sub_transport as transport", "adv.inner_id" , "=" , "transport.id" )                
                            ->join("car_mark", "car_mark.id_car_mark" , "=" , "transport.mark" )                
                            ->join("car_model", "car_mark.id_car_mark" , "=" , "car_model.id_car_mark" )                
                            ->where( "adv.id", $id )                                
                            ->limit(1)
                            ->get();                                
            }

            // грузовое авто
            if ($advertData[0]->category_id == 1 && $advertData[0]->subcategory_id == 2) {

                \Debugbar::info("грузовое авто");

                    $advert = DB::table("adverts as adv")->select(                                 
                            "adv.category_id",
                            "adv.subcategory_id",
                            "adv.startDate",
                            "adv.id", 
                            "adv.title", 
                            "adv.text", 
                            "adv.price", 
                            "adv.phone", 
                            "adv.coord_lat", 
                            "adv.coord_lon", 
                            "transport.type",                                
                            "transport.year", 
                            "transport.mileage",
                            DB::raw("CASE WHEN transport.steering_position=0 THEN 'слева' ELSE 'справа' END as steering_position"),                            
                            DB::raw($this->raw_engine_type),
                            DB::raw("CASE WHEN transport.customs=1 THEN 'да' ELSE 'нет' END as customs"),                                
                            DB::raw("`kz_region`.`name` AS region_name, `kz_city`.`name` AS city_name"),
                            DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"),
                            "categories.name as category_name",
                            "categories.url as category_url",
                            "subcats.name as subcat_name",
                            "subcats.url as subcat_url"
                            )
                            ->join("categories", "adv.category_id" , "=" , "categories.id" )
                            ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                            ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                            ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )                
                            ->join("sub_transport as transport", "adv.inner_id" , "=" , "transport.id" )                
                            ->where( "adv.id", $id )                                
                            ->limit(1)
                            ->get();                                
            }

            // мототехника
            if ($advertData[0]->category_id == 1 && $advertData[0]->subcategory_id == 3) {

                            $advert = DB::table("adverts as adv")->select(
                                "adv.category_id",
                                "adv.subcategory_id",
                                "adv.startDate",                                
                                "adv.id", 
                                "adv.title", 
                                "adv.text", 
                                "adv.price", 
                                "adv.phone", 
                                "adv.coord_lat", 
                                "adv.coord_lon",
                                "categories.name as category_name",
                                "categories.url as category_url",
                                "subcats.name as subcat_name",
                                "subcats.url as subcat_url",
                                DB::raw("kz_region.name AS region_name, kz_city.name AS city_name"),
                                DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"))
                                ->join("categories", "adv.category_id" , "=" , "categories.id" )
                                ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                                ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                                ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )                
                                ->where( "adv.id", $id )
                                ->limit(1)
                                ->get();
            }

            // спецтехника
            if ($advertData[0]->category_id == 1 && $advertData[0]->subcategory_id == 4) {
                    
                            $advert = DB::table("adverts as adv")->select(
                                "adv.category_id",
                                "adv.subcategory_id",                            
                                "adv.startDate",                                    
                                "adv.id", 
                                "adv.title", 
                                "adv.text", 
                                "adv.price", 
                                "adv.phone", 
                                "adv.coord_lat", 
                                "adv.coord_lon",
                                "categories.name as category_name",
                                "categories.url as category_url",
                                "subcats.name as subcat_name",
                                "subcats.url as subcat_url", 
                                DB::raw("kz_region.name AS region_name, kz_city.name AS city_name"),
                                DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"))                            
                                ->join("categories", "adv.category_id" , "=" , "categories.id" )
                                ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                                ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                                ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )                
                                ->where( "adv.id", $id )
                                ->limit(1)
                                ->get();
            }

            // ретро авто
            if ($advertData[0]->category_id == 1 && $advertData[0]->subcategory_id == 5) {

                    $advert = DB::table("adverts as adv")->select(                                 
                            "adv.category_id",
                            "adv.subcategory_id",
                            "adv.startDate",
                            "adv.id", 
                            "adv.title", 
                            "adv.text", 
                            "adv.price", 
                            "adv.phone", 
                            "adv.coord_lat", 
                            "adv.coord_lon", 
                            "transport.type",                                
                            "transport.year", 
                            "transport.mileage",
                            "categories.name as category_name",
                            "categories.url as category_url",
                            "subcats.name as subcat_name",
                            "subcats.url as subcat_url",  
                            DB::raw("CASE WHEN transport.steering_position=0 THEN 'слева' ELSE 'справа' END as steering_position"),                            
                            DB::raw($this->raw_engine_type),
                            DB::raw("CASE WHEN transport.customs=1 THEN 'да' ELSE 'нет' END as customs"),                                
                            DB::raw("`kz_region`.`name` AS region_name, `kz_city`.`name` AS city_name"),
                            DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"))
                            ->join("categories", "adv.category_id" , "=" , "categories.id" )
                            ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                            ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                            ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )                
                            ->join("sub_transport as transport", "adv.inner_id" , "=" , "transport.id" )                
                            ->where( "adv.id", $id )                                
                            ->limit(1)
                            ->get();                                
            }
            
            // выборка для остального траспорта
            if ($advertData[0]->category_id == 1 && $advertData[0]->subcategory_id > 5) {                        

                    $advert = DB::table("adverts as adv")->select(                                 
                        "adv.category_id",
                        "adv.subcategory_id",        
                        "adv.startDate",                         
                        "adv.id", 
                        "adv.title", 
                        "adv.text", 
                        "adv.price", 
                        "adv.phone", 
                        "adv.coord_lat", 
                        "adv.coord_lon",
                        "categories.name as category_name",
                        "categories.url as category_url",
                        "subcats.name as subcat_name",
                        "subcats.url as subcat_url",   
                        DB::raw("kz_region.name AS region_name, kz_city.name AS city_name"),
                        DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"))
                        ->join("categories", "adv.category_id" , "=" , "categories.id" )
                        ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                        ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                        ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )                    
                        ->where( "adv.id", $id )
                        ->limit(1)
                        ->get();
            }
           
            // квартира
            if ($advertData[0]->category_id == 2 && $advertData[0]->subcategory_id == 9) {
                    
                $advert = DB::table("adverts as adv")->select(                                 
                    "adv.category_id",
                    "adv.subcategory_id",
                    "adv.startDate",
                    "adv.id", 
                    "adv.title", 
                    "adv.text", 
                    "adv.price", 
                    "adv.phone", 
                    "adv.coord_lat", 
                    "adv.coord_lon",
                    "realestate.property_type",
                    "realestate.floor",
                    "realestate.floors_house",
                    "realestate.rooms",
                    "realestate.area",
                    "categories.name as category_name",
                    "categories.url as category_url",
                    "subcats.name as subcat_name",
                    "subcats.url as subcat_url",   
                    DB::raw("CASE WHEN realestate.ownership=0 THEN 'собственник' ELSE 'посредник' END as ownership"),
                    DB::raw("CASE WHEN realestate.kind_of_object=0 THEN 'вторичка' ELSE 'новостройка' END as kind_of_object"),                        
                    DB::raw("`kz_region`.`name` AS region_name, `kz_city`.`name` AS city_name"),
                    DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"))
                    ->join("categories", "adv.category_id" , "=" , "categories.id" )
                    ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                    ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                    ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )                                
                    ->join("sub_realestate as realestate", "adv.inner_id" , "=" , "realestate.id" )                                
                    ->where( "adv.id", $id )                                
                    ->limit(1)
                    ->get();                                                        
            }
            // комната
            if ($advertData[0]->category_id == 2 && $advertData[0]->subcategory_id == 10) {
                    
                $advert = DB::table("adverts as adv")->select(                                 
                    "adv.category_id",
                    "adv.subcategory_id",
                    "adv.startDate",
                    "adv.id", 
                    "adv.title", 
                    "adv.text", 
                    "adv.price", 
                    "adv.phone", 
                    "adv.coord_lat", 
                    "adv.coord_lon",
                    "realestate.property_type",
                    "realestate.floor",
                    "realestate.floors_house",
                    "realestate.area",
                    "categories.name as category_name",
                    "categories.url as category_url",
                    "subcats.name as subcat_name",
                    "subcats.url as subcat_url",   
                    DB::raw("CASE WHEN realestate.ownership=0 THEN 'собственник' ELSE 'посредник' END as ownership"),                        
                    DB::raw("`kz_region`.`name` AS region_name, `kz_city`.`name` AS city_name"),
                    DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"))
                    ->join("categories", "adv.category_id" , "=" , "categories.id" )
                    ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                    ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                    ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )                                
                    ->join("sub_realestate as realestate", "adv.inner_id" , "=" , "realestate.id" )                                
                    ->where( "adv.id", $id )                                
                    ->limit(1)
                    ->get();                                                        
            }
            // дом, дача, коттедж
            if ($advertData[0]->category_id == 2 && $advertData[0]->subcategory_id == 11) {
                    
                $advert = DB::table("adverts as adv")->select(                                 
                    "adv.category_id",
                    "adv.subcategory_id",
                    "adv.startDate",
                    "adv.id", 
                    "adv.title", 
                    "adv.text", 
                    "adv.price", 
                    "adv.phone", 
                    "adv.coord_lat", 
                    "adv.coord_lon",
                    "realestate.property_type",                        
                    "realestate.rooms",
                    "realestate.area",                        
                    DB::raw("CASE WHEN realestate.ownership=0 THEN 'собственник' ELSE 'посредник' END as ownership"),
                    DB::raw("CASE WHEN realestate.kind_of_object=0 THEN 'вторичка' ELSE 'новостройка' END as kind_of_object"),
                    DB::raw("CASE 
                    WHEN realestate.type_of_building=0 THEN 'дом' 
                    WHEN realestate.type_of_building=1 THEN 'дача' 
                    WHEN realestate.type_of_building=2 THEN 'коттедж' 
                    ELSE '-' 
                    END as type_of_building"),
                    "categories.name as category_name",
                    "categories.url as category_url",
                    "subcats.name as subcat_name",
                    "subcats.url as subcat_url",   
                    DB::raw("`kz_region`.`name` AS region_name, `kz_city`.`name` AS city_name"),
                    DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"))
                    ->join("categories", "adv.category_id" , "=" , "categories.id" )
                    ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                    ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                    ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )                                
                    ->join("sub_realestate as realestate", "adv.inner_id" , "=" , "realestate.id" )                                
                    ->where( "adv.id", $id )                                
                    ->limit(1)
                    ->get();                                                        
            }
            // земельный участок
            if ($advertData[0]->category_id == 2 && $advertData[0]->subcategory_id == 12) {
                    
                $advert = DB::table("adverts as adv")->select(                                 
                    "adv.category_id",
                    "adv.subcategory_id",
                    "adv.startDate",
                    "adv.id", 
                    "adv.title", 
                    "adv.text", 
                    "adv.price", 
                    "adv.phone", 
                    "adv.coord_lat", 
                    "adv.coord_lon",
                    "realestate.area",
                    "categories.name as category_name",
                    "categories.url as category_url",
                    "subcats.name as subcat_name",
                    "subcats.url as subcat_url",   
                    DB::raw("CASE WHEN realestate.ownership=0 THEN 'собственник' ELSE 'посредник' END as ownership"),                        
                    DB::raw("`kz_region`.`name` AS region_name, `kz_city`.`name` AS city_name"),
                    DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"))
                    ->join("categories", "adv.category_id" , "=" , "categories.id" )
                    ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                    ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                    ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )                                
                    ->join("sub_realestate as realestate", "adv.inner_id" , "=" , "realestate.id" )                                
                    ->where( "adv.id", $id )                                
                    ->limit(1)
                    ->get();                                                        
            }
            // гараж или машиноместо
            if ($advertData[0]->category_id == 2 && $advertData[0]->subcategory_id == 13) {
                    
                $advert = DB::table("adverts as adv")->select(                                 
                    "adv.category_id",
                    "adv.subcategory_id",
                    "adv.startDate",
                    "adv.id", 
                    "adv.title", 
                    "adv.text", 
                    "adv.price", 
                    "adv.phone", 
                    "adv.coord_lat", 
                    "adv.coord_lon",                        
                    "realestate.area",
                    "categories.name as category_name",
                    "categories.url as category_url",
                    "subcats.name as subcat_name",
                    "subcats.url as subcat_url",   
                    DB::raw("CASE WHEN realestate.ownership=0 THEN 'собственник' ELSE 'посредник' END as ownership"),                        
                    DB::raw("`kz_region`.`name` AS region_name, `kz_city`.`name` AS city_name"),
                    DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"))
                    ->join("categories", "adv.category_id" , "=" , "categories.id" )
                    ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                    ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                    ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )                                
                    ->join("sub_realestate as realestate", "adv.inner_id" , "=" , "realestate.id" )                                
                    ->where( "adv.id", $id )                                
                    ->limit(1)
                    ->get();                                                        
            }
            // коммерческая недвижимость
            if ($advertData[0]->category_id == 2 && $advertData[0]->subcategory_id == 14) {
                    
                $advert = DB::table("adverts as adv")->select(                                 
                    "adv.category_id",
                    "adv.subcategory_id",
                    "adv.startDate",
                    "adv.id", 
                    "adv.title", 
                    "adv.text", 
                    "adv.price", 
                    "adv.phone", 
                    "adv.coord_lat", 
                    "adv.coord_lon",
                    "realestate.property_type",                        
                    "realestate.rooms",
                    "realestate.area",               
                    "categories.name as category_name",
                    "categories.url as category_url",
                    "subcats.name as subcat_name",
                    "subcats.url as subcat_url",   
                    DB::raw("CASE WHEN realestate.ownership=0 THEN 'собственник' ELSE 'посредник' END as ownership"),
                    DB::raw("CASE WHEN realestate.kind_of_object=0 THEN 'вторичка' ELSE 'новостройка' END as kind_of_object"),
                    DB::raw("CASE 
                    WHEN realestate.type_of_building=0 THEN 'дом' 
                    WHEN realestate.type_of_building=1 THEN 'дача' 
                    WHEN realestate.type_of_building=2 THEN 'коттедж' 
                    ELSE '-' 
                    END as type_of_building"),                        
                    DB::raw("`kz_region`.`name` AS region_name, `kz_city`.`name` AS city_name"),
                    DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"))
                    ->join("categories", "adv.category_id" , "=" , "categories.id" )
                    ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                    ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                    ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )                                
                    ->join("sub_realestate as realestate", "adv.inner_id" , "=" , "realestate.id" )                                
                    ->where( "adv.id", $id )                                
                    ->limit(1)
                    ->get();                                                        
            }
            // недвижимость за рубежом
            if ($advertData[0]->category_id == 2 && $advertData[0]->subcategory_id == 15) {
                    
                $advert = DB::table("adverts as adv")->select(                                 
                    "adv.category_id",
                    "adv.subcategory_id",
                    "adv.startDate",
                    "adv.id", 
                    "adv.title", 
                    "adv.text", 
                    "adv.price", 
                    "adv.phone", 
                    "adv.coord_lat", 
                    "adv.coord_lon",
                    "realestate.property_type",                        
                    "realestate.rooms",
                    "realestate.area",                        
                    "categories.name as category_name",
                    "categories.url as category_url", 
                    "subcats.name as subcat_name",
                    "subcats.url as subcat_url",   
                    DB::raw("CASE WHEN realestate.ownership=0 THEN 'собственник' ELSE 'посредник' END as ownership"),
                    DB::raw("CASE WHEN realestate.kind_of_object=0 THEN 'вторичка' ELSE 'новостройка' END as kind_of_object"),
                    DB::raw("CASE 
                    WHEN realestate.type_of_building=0 THEN 'дом' 
                    WHEN realestate.type_of_building=1 THEN 'дача' 
                    WHEN realestate.type_of_building=2 THEN 'коттедж' 
                    ELSE '-' 
                    END as type_of_building"),                        
                    DB::raw("`kz_region`.`name` AS region_name, `kz_city`.`name` AS city_name"),
                    DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"))
                    ->join("categories", "adv.category_id" , "=" , "categories.id" )
                    ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                    ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                    ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )                                
                    ->join("sub_realestate as realestate", "adv.inner_id" , "=" , "realestate.id" )                                
                    ->where( "adv.id", $id )                                
                    ->limit(1)
                    ->get();                                                        
            }
            
            // выборка для всего остального
            if ($advertData[0]->category_id > 2 && $advertData[0]->subcategory_id > 0 || $advertData[0]->category_id>0 && !$advertData[0]->subcategory_id) {                        
                                    
                    $advert = DB::table("adverts as adv")->select(                                 
                        "adv.startDate",
                        "adv.category_id",
                        "adv.subcategory_id",                        
                        "adv.id", 
                        "adv.title", 
                        "adv.text", 
                        "adv.price", 
                        "adv.phone", 
                        "adv.coord_lat", 
                        "adv.coord_lon", 
                        "categories.name as category_name",
                        "categories.url as category_url",
                        "subcats.name as subcat_name",
                        "subcats.url as subcat_url",   
                        DB::raw("kz_region.name AS region_name, kz_city.name AS city_name"),
                        DB::raw("`kz_region`.`url` AS region_url, `kz_city`.`url` AS city_url"))
                        ->join("kz_region", "adv.region_id" , "=" , "kz_region.region_id" )                
                        ->join("kz_city", "adv.city_id" , "=" , "kz_city.city_id" )
                        ->join("categories", "adv.category_id" , "=" , "categories.id" )
                        ->join("subcats", "adv.subcategory_id" , "=" , "subcats.id" )
                        ->where( "adv.id", $id )
                        ->limit(1)
                        ->get();
            }

            \DebugBar::info($advert); 
            \Debugbar::info("advert count: ".count($advert));

            if (count($advert)==0) {
              return view("errors/404");
            }
                                
            $images = Images::select(DB::raw( "concat('".Common::getImagesPath()."/normal/', name) AS name" ))->where("advert_id", $id)->get();
            \Debugbar::info($advert);
            \Debugbar::info($images); 
    
            // проработать СЕО -->
            return view("details")
            ->with( "title", $advert[0]->title )
            ->with( "description", $advert[0]->title )
            ->with( "keywords", $advert[0]->title)                
            ->with( "advert", $advert[0])                
            ->with( "images", $images)
            ->with( "vip_price", Common::getVipPrice())
            ->with( "srochno_torg_price", Common::getSrochnoTorgPrice())
            ->with( "color_price", Common::getColorPrice());
    }
}
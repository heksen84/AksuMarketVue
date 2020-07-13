<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
  <title>{{ $title }}</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <meta name="description" content="{{ $description }}">
  <meta name="keywords" content="{{ $keywords }}">
  <link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap.min.css') }}">
  <link rel="stylesheet" type="text/css" href="{{ mix('css/common.css') }}">
  <link rel="stylesheet" type="text/css" href="{{ mix('css/details.css') }}">
</head>
<body>
<div class="container-fluid mycontainer">

<div class="modal" tabindex="-1" role="dialog" id="billingModalDialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p></p>        
        <h5 class="text-right"></h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="continueBilling">Продолжить</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>
      </div>
    </div>
  </div>
</div>
    
    <div class="row"> 
      <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-2">                  
          <div class="close-link mb-4" title="Закрыть страницу">закрыть</div>        
            <div id="posted"><span>{{ date("Размещено d.m.Y в H:i", strtotime($advert->startDate)) }}</span></div>
              <div id="location">{{ $advert->region_name }}, {{ $advert->city_name }}</div>
                @if ($advert->category_name)
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb p-0" style="background:rgb(245,245,245);border-radius:5px;font-size:15px">
                      <li class="breadcrumb-item"><a href="\">ilbo.kz</a></li>
                      <li class="breadcrumb-item"><a href="\{{ $advert->region_url }}\{{ $advert->city_url }}\c\{{ $advert->category_url }}">{{ $advert->category_name }}</a></li>
                        @if ($advert->category_id < 10  && $advert->subcat_name)
                          <li class="breadcrumb-item"><a href="\{{ $advert->region_url }}\{{ $advert->city_url }}\c\{{ $advert->category_url }}\{{ $advert->subcat_url }}">{{ $advert->subcat_name }}</a></li>
                        @endif
                    </ol>
                  </nav>
                @endif

                <!-- индикаторы объявления -->
                <div class="text-right">                            
                  @if ($advert->top)
                    <span class="badge badge-primary" title="с {{ date('d.m.Y', strtotime($advert->topStartDate)) }} по {{ date('d.m.Y', strtotime($advert->topFinishDate)) }}">В топе</span>
                  @endif
                  @if ($advert->srochno)
                    <span class="badge badge-danger" title="с {{ date('d.m.Y', strtotime($advert->srochnoStartDate)) }} по {{ date('d.m.Y', strtotime($advert->srochnoFinishDate)) }}">Срочное</span>
                  @endif
                  @if ($advert->color)                  
                    <span class="badge badge-success" title="с {{ date('d.m.Y', strtotime($advert->colorStartDate)) }} по {{ date('d.m.Y', strtotime($advert->colorFinishDate)) }}">Выделено</span>
                  @endif
                </div>
              
                @if ($advert->title!="null") 
                  <h1>{{ $advert->title }}</h1><hr>
                @endif              

              <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-action text-center">
                @if (!$advert->top)
                  <button class="btn btn-outline-primary btn-sm m-1" id="makeVip">В топ ( VIP )</button>
                @endif
                @if (!$advert->srochno)
                  <button class="btn btn-outline-danger btn-sm m-1" id="makeTorg">Срочно</button>
                @endif
                @if (!$advert->color)
                  <button class="btn btn-outline-success btn-sm m-1" id="makePaint">Выделить</button>
                @endif                
                <!--<button class="btn btn-outline-secondary btn-sm m-1" id="prodlit">Продлить</button>-->
              </div>

              @if (count($images)>0)
              <div id="carousel" class="carousel slide mt-2" data-ride="carousel">
                  @if (count($images)>1)
                    <ol class="carousel-indicators">                    
                      @foreach($images as $index => $image)
                        @if ($index==0)
                          <li data-target="#carousel" data-slide-to="0" class="active"></li>
                        @else
                          <li data-target="#carousel" data-slide-to="{{ $index }}"></li>
                        @endif
                      @endforeach
                    </ol>
                  @endif
                  <div class="carousel-inner">
                    @foreach($images as $index => $image)
                      @if ($index==0)
                        <div class="carousel-item active">
                          <img class="d-block w-100" src="{{ $image->name }}" onerror="this.onerror=null;this.src=''" loading="lazy">
                        </div>
                      @else
                        <div class="carousel-item">
                          <img class="d-block w-100" src="{{ $image->name }}" onerror="this.onerror=null;this.src=''" loading="lazy">
                        </div>
                      @endif
                    @endforeach
                  </div>
                  @if (count($images)>1)
                    <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Назад</span>
                    </a>                  
                    <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Вперёд</span>
                    </a>
                  @endif
              </div>
              @endif            
            <br>              
              <!----------------------------------------------------------------
                подключаю характеристики по категориям
               ----------------------------------------------------------------->	       
              <!-- транспорт -->
              @if ($advert->category_id==1 && $advert->subcategory_id==1) 
                @include('results/transport/legkovoy')
              @elseif ($advert->category_id==1 && $advert->subcategory_id==2)
                @include('results/transport/common')          
              @elseif ($advert->category_id==1 && $advert->subcategory_id==5)
                @include('results/transport/common')
              @endif

              <!-- недвижимость -->
              @if ($advert->category_id==2 && $advert->subcategory_id==9) 
                @include('results/nedvizhimost/kvartira')
              @elseif ($advert->category_id==2 && $advert->subcategory_id==10)
                @include('results/nedvizhimost/komnata')          
              @elseif ($advert->category_id==2 && $advert->subcategory_id==11)
                @include('results/nedvizhimost/dom_dacha_kottedzh')
              @elseif ($advert->category_id==2 && $advert->subcategory_id==12)
                @include('results/nedvizhimost/zemelnyu_uchastok')
              @elseif ($advert->category_id==2 && $advert->subcategory_id==13)
                @include('results/nedvizhimost/garazh_ili_mashinomesto')  
              @elseif ($advert->category_id==2 && $advert->subcategory_id==14)
                @include('results/nedvizhimost/komm_nedvizhimost')  
              @elseif ($advert->category_id==2 && $advert->subcategory_id==15)
                @include('results/nedvizhimost/nedvizhimost_za_rubezhom')  
              @endif
                            
              @if ($advert->text!="null")              
                <b>Описание:</b>
                <div id="text">{{ $advert->text }}</div>
              @endif
                      
              <!-- убираю цену в категориях работа и бизнес (category_id!=4) -->
              @if ($advert->price!="null" && $advert->category_id!=4)
              <br>                           
                <div id="price">{{ $advert->price }} ₸</div>
              @endif              
                            
              <div class="text-center m-3">
                <button type="button" class="btn btn-outline-success" id="numberButton">Показать телефон</button>            
              </div>  

              <div id="phone-number"></div>
              <div id="map"></div> 
      </div>

  <!-- РЕКЛАМА -->
  <!--<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 text-center">
  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>  
  <ins class="adsbygoogle"
     style="display:inline-block;width:100%;height:100px"
     data-ad-client="ca-pub-8074944108437227"
     data-ad-slot="2249357572"></ins>
    <script>
     (adsbygoogle = window.adsbygoogle || []).push({});
    </script>
  </div>-->
</div>

<script>
  window.advert_id = "{{$advert->id}}";
  window.coord_lat = "{{$advert->coord_lat}}"; 
  window.coord_lon = "{{$advert->coord_lon}}";
  window.vip_price = "{{$vip_price}}";
  window.srochno_torg_price = "{{$srochno_torg_price}}";
  window.color_price = "{{$color_price}}";  
</script>

<script src="https://api-maps.yandex.ru/2.0-stable/?apikey=123&load=package.standard&lang=ru-RU" type="text/javascript"></script>
<script type="text/javascript" src="{{ mix('js/common.js') }}"></script>  
<script type="text/javascript" src="{{ mix('js/details.js') }}"></script>

</body>
</html>
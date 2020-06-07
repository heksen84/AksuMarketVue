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
  <link rel="stylesheet" type="text/css" href="{{ mix('css/home.css') }}">
</head>
<body>

<div class="modal" tabindex="-1" role="dialog" id="payment_window">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="payment_window_title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p id="desc"></p>
        <h6>Цена <span id="price"></span> тнг.</h6>        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-success">Оплатить</button>
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Отмена</button>
      </div>
    </div>
  </div>
</div>

<div class="modal" tabindex="-1" role="dialog" id="delete_advert_window">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Удаление объявления</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h6>Вы действительно желаете удалить объявление?</h6>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-danger" id="delete_advert_button">Да</button>
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Нет</button>
      </div>
    </div>
  </div>
</div>

<div class="modal" tabindex="-1" role="dialog" id="advert_deleted_window">
  <div class="modal-dialog modal-dialog-centered " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Готово</h5>        
      </div>
      <div class="modal-body">
        <h6>Ваше объявление успешно удалено</h6>
      </div>
      <div class="modal-footer">        
        <button type="button" class="btn btn-outline-primary" id="close_advert_deleted_message_window">закрыть</button>
      </div>
    </div>
  </div>
</div>

  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a href="/">На главную</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="/podat-objavlenie">Подать объявление <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Счёт: 4000 тнг. [ пополнить ]</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/logout"><b>Выход</b></a>
      </li>      
    </ul>
  </div>
</nav>

<div class="container-fluid mycontainer text-center">
  @if (count($items)>0)
    @foreach($items as $key => $item)
      <div class="row text-left">
        <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8 col-title">        
        <span id="title">{{ $item->title }}</span>
        <!--<b><div>Просмотров(?)|Сообщений(?)</div></b>-->
        </div>
        <div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2 col-status text-center"><span id="status"><ins>cтатус</ins><br>на модерации</span></div>
        <div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2 col-action text-center actions" data-id={{ $item->id }}>
          <button class="btn btn-outline-primary btn-sm m-1 prodlit">Продлить</button>            
          <!--<button class="btn btn-outline-primary btn-sm m-1">Срочно, торг</button>          
          <button class="btn btn-outline-success btn-sm m-1">В топ (vip)</button>
          <button class="btn btn-outline-secondary btn-sm m-1">Покрасить</button>          
          <button class="btn btn-outline-danger btn-sm m-1">Удалить</button>-->
        </div>
      </div>
  @endforeach 
@else  
  <h3 class="mt-3">нет объявлений</h3>  
  <a href="/podat-objavlenie" class="btn btn-success mt-2" role="button" style="width:210px">Подать объявление</a>
@endif

<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-4">  
    <div class="pagination justify-content-center pagination">      
      {{ $items->links() }}                         
    </div>
</div>
  
</div>
<script type="text/javascript" src="{{ mix('js/home.js') }}"></script>
</body>
</html>
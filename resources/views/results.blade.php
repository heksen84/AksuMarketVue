<!-- Ilya Bobkov Aksu 2018(R) -->
<html lang="{{ app()->getLocale() }}">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="keywords" content="get numbers, free numbers" />
  <meta name="description" content="Купить, продать, обменять или сдать в аренду {{ $title }}">
  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <title>{{ $title }}</title>
  <link rel="icon" href="{{ asset('public/shop.ico') }}">
</head>
<body>
<div id="app">
  <results 
  :title="{{ json_encode($title) }}"
  :category="{{ $category }}" 
  :category_name="{{ $category_name }}" 
  :results="{{ $results }}" 
  :data="{{ $items }}"
  :total_records="{{ $total_records }}">
  </results>
</div>
</body>
</html>
<script type="text/javascript" src="{{ mix('js/app.js') }}"></script>
<link rel="stylesheet" type="text/css" href="{{ mix('css/app.css') }}">

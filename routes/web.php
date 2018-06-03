<?php
Auth::routes();
Route::get('/', function () { return view('welcome')->with("items", "123"); });
Route::get('/home', 'HomeController@index')->name('home');
Route::get('/newtrip', function () { return view('newtrip'); });
Route::get('/categories', 'CategoriesController@index');
Route::get('/search', function () { return view('search'); });
Route::get('/create', function () { return view('create'); });
Route::get('/category/{id}', function () { return view('category'); });
Route::get('/logout', '\App\Http\Controllers\Auth\LoginController@logout');

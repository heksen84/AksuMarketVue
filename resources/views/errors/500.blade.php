@extends('errors::minimal')

@section('title', __('Ошибка сервера'))
@section('code', '500')
@section('message', __('Приносим извинения за неудобства, но в данный момент мы не можем обработать ваш запрос.'))

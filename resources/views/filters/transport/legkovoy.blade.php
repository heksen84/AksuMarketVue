@if ($region && !$city)
	<form id="filters-form" action="/{{$region}}/c/{{$category}}/{{$subcategory}}">
@elseif ($region && $city)
	<form id="filters-form" action="/{{$region}}/{{$city}}/c/{{$category}}/{{$subcategory}}">
@else
	<form id="filters-form" action="/c/{{$category}}/{{$subcategory}}">
@endif
		<div class="row p-2">
			<div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
				<div class="form-group mx-1">
    				<label for="mark">Марка</label>
    				<select class="form-control form-control-sm" id="mark" name="mark"></select>
  				</div> 
			</div>

			<div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3">
				<div class="form-group mx-1">
    				<label for="model">Модель</label>
    				<select class="form-control form-control-sm" id="model" name="model"></select>
  				</div> 
			</div>

			<div class="col-5 col-sm-5 col-md-5 col-lg-2 col-xl-2">
				<div class="form-group mx-1">
		 			<label for="year_ot">Год выпуска</label>
					<input type="number" placeholder="от" id="year_ot" class="form-control form-control-sm" name="year_ot" value="{{$filters['year_ot']}}"/>
				</div>
			</div>

			<div class="col-5 col-sm-5 col-md-5 col-lg-2 col-xl-2">
				<div class="form-group mx-1">
		 			<label for="year_do">&nbsp;</label>
					<input type="number" placeholder="до" id="year_do" class="form-control form-control-sm" name="year_do" value="{{$filters['year_do']}}"/>
				</div>
			</div>

		</div>

		<div class="row p-2" style="margin-top:-13px">

			<div class="col-5 col-sm-5 col-md-5 col-lg-2 col-xl-2">
				<div class="form-group mx-1">
		 			<label for="mileage_ot">Пробег (км.)</label>
					<input type="number" placeholder="от" id="mileage_ot" class="form-control form-control-sm" name="mileage_ot" value="{{$filters['mileage_ot']}}"/>
				</div>
			</div>

			<div class="col-5 col-sm-5 col-md-5 col-lg-2 col-xl-2">
				<div class="form-group mx-1">
		 			<label for="mileage_do">&nbsp;</label>
					<input type="number" placeholder="до" id="mileage_do" class="form-control form-control-sm" name="mileage_do" value="{{$filters['mileage_do']}}"/>
				</div>
			</div>

			<div class="col-4 col-sm-4 col-md-4 col-lg-2 col-xl-2">
				<div class="form-group mx-1">
    				<label for="customs">Растоможен</label>
    				<select class="form-control form-control-sm" id="customs" name="model">
						<option>Да</option>
						<option>Нет</option>
    				</select>
  				</div> 
			</div>

			<div class="col-5 col-sm-5 col-md-5 col-lg-2 col-xl-2">
				<div class="form-group mx-1">
    				<label for="engine_type">Тип двигателя</label>
    				<select class="form-control form-control-sm" id="engine_type" name="engine_type">
					  	<option>Дизель</option>
						<option>Бензин</option>
    				</select>
  				</div> 
			</div>
		</div>
		
		<div class="row p-2" style="margin-top:-13px">		
			<div class="col-4 col-sm-4 col-md-4 col-lg-2 col-xl-2">
				<div class="form-group mx-1">
		 			<label for="price_ot">Цена</label>
					<input type="number" placeholder="от" id="price_ot" class="form-control form-control-sm" name="price_ot" value="{{$filters['price_ot']}}" />
				</div>
			</div>

			<div class="col-4 col-sm-4 col-md-4 col-lg-2 col-xl-2">
				<div class="form-group mx-1">
		 			<label for="price_do">&nbsp;</label>
					<input type="number" placeholder="до" id="price_do" class="form-control form-control-sm" name="price_do" value="{{$filters['price_do']}}" />
				</div>
			</div>

			<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-center">
				<div class="mx-1 mb-2">
					<button type="submit" class="btn btn-sm btn-outline-success">применить</button>
				</div>
			</div>

		</div>
</form>
<script>
  window.mark = "{{ $filters['mark'] }}";
  window.model = "{{ $filters['model'] }}";
</script>
<form class="form-inline" @submit="onSubmit">  		
	<!--<div class="form-group mx-1">
		Цена:
	</div>-->
	<div class="form-group mx-1">
		<label for="startPrice" class="sr-only">От</label>
		<input type="text" id="startPrice" v-model="start_price" class="form-control form-control-sm" style="width:100px" placeholder="от" required/>
	</div>
	 <div class="form-group mx-1">
		 <label for="endPrice" class="sr-only">До</label>
		<input type="text" id="endPrice" v-model="end_price" class="form-control form-control-sm" style="width:100px" placeholder="до" required/>
	</div>

	<div class="form-group mx-1">
		 <label for="endPrice" class="sr-only">Марка</label>
		<input type="text" id="endPrice" v-model="end_price" class="form-control form-control-sm" style="width:100px" placeholder="Марка" required/>
	</div>

	<div class="form-group mx-1">
		 <label for="endPrice" class="sr-only">Модель</label>
		<input type="text" id="endPrice" v-model="end_price" class="form-control form-control-sm" style="width:100px" placeholder="Модель" required/>
	</div>

	<div class="form-group mx-1">
		 <label for="endPrice" class="sr-only">Модель</label>
		<input type="text" id="endPrice" v-model="end_price" class="form-control form-control-sm" style="width:100px" placeholder="Год выпуска" required/>
	</div>

	<div class="form-group mx-1">
		<button type="submit" class="btn btn-sm btn-primary">применить</button>
	</div>
</form>
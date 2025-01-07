/*=============================================
Poner Imagen de Fondo
=============================================*/	

$(document).on("click",".imgBackground",function(){

	$(this).parent().parent().css({"background-image":"url('/views/assets/img/placeholder-square.svg')","background-position":"center","background-repeat":"no-repeat","background-size":"cover"});

	$(this).parent().find(".noBackground").show();
	$(this).hide();

})

/*=============================================
Quitar Imagen de Fondo
=============================================*/

$(document).on("click",".noBackground",function(){

	$(this).parent().parent().removeAttr("style");
	$(this).parent().find(".imgBackground").show();
	$(this).hide();

})


/*=============================================
Eliminar módulo del DOM
=============================================*/
$(document).on("click",".deleteModule",function(){

	fncSweetAlert("confirm","¿Está seguro de borrar este módulo?","").then(resp=>{

		if(resp){

			$(this).parent().parent().remove();
		}
	})
})

/*=============================================
Ver Código
=============================================*/

$(document).on("click",".showCode",function(){

	/*=============================================
	desaparecer botón de código y mostrar btn de plantilla
	=============================================*/

	$(".showTemplate").show();
	$(this).hide();

	$("#visorContent").html($("#builderContent").html());

	/*=============================================
	Limpiamos el código de la plantilla
	=============================================*/

	$("#visorContent").find(".editContent").removeClass("editContent");
	$("#visorContent").find(".btnContent-left").remove();
	$("#visorContent").find(".btnContent-right").remove();
	$("#visorContent").find(".newContent").remove();

	/*=============================================
	Capturamos el código de la plantilla
	=============================================*/
	var codeDashboard = $("#visorContent").html();

	var data = new FormData();
	data.append("code", codeDashboard);

	$.ajax({

		url: "/ajax/grid.ajax.php",
		method: "POST",
  		data: data,
  		contentType: false,
  		cache: false,
  		processData: false,
  		success: function (response){ 

			/*=============================================
			Escondemos el tablero y aparecemos el visor de código
			=============================================*/
			$("#builderContent").hide();
			$(".codeView").show();
			$(".codemirror-bootstrap").val(response);

			/*=============================================
			Codemirror
			=============================================*/

			if($(".codemirror-bootstrap").length > 0){

				var code = $(".codemirror-bootstrap")[0];
				var editor = CodeMirror.fromTextArea(code, {
					lineNumbers : true,
					lineWrapping: true,
					tabSize:3,
					styleActiveLine: true,
					theme:"udb-dark",
					matchBrackets: true,
					autoRefresh:true,
					mode: "text/html",
				});

				editor.on("change", function(event){

					var codeEditor = event.getValue();

					/*=============================================
					Copiar código después de algún cambio
					=============================================*/			

					$(document).on("click",".copy-bs",function(){

						copyToClipboard(event.getValue());

					})
				})

				/*=============================================
				Autoindentar
				=============================================*/

				editor.setSelection({
					'line':editor.firstLine(),
					'ch':0,
					'sticky':null
				},{
					'line':editor.lastLine(),
					'ch':0,
					'sticky':null
				},
				{scroll:false});

				editor.indentSelection("smart");
				editor.setCursor({line:0, ch:0});


				/*=============================================
				Copiar código inicial del textarea
				=============================================*/	

				$(document).on("click",".copy-bs",function(){

					copyToClipboard($(".copy-bs").parent().children(".codemirror-bootstrap").val());

				})


			}

		}
	

	})

})

/*=============================================
Ver Plantilla
=============================================*/

$(document).on("click",".showTemplate",function(){

	$(".codeView").hide();
	$("#builderContent").show();
	$(".showCode").show();
	$(this).hide();
})

/*=============================================
Draggable
=============================================*/

if($(".moveModule").length > 0){

	var moveModule = $(".moveModule");

	moveModule.each((i)=>{

		$(moveModule[i]).draggable({
			revert: true
		});
	})

}

/*=============================================
Droppable https://jqueryui.com/droppable/
=============================================*/
reloadNewContent();

function reloadNewContent(){

	if($(".newContent").length > 0){

		var newContent = $(".newContent");

		newContent.each((i)=>{

			$(newContent[i]).droppable({
				classes: {
			        "ui-droppable-hover": "ui-state-active"
			     },
				drop: function(event, ui){
					
					var idModule = ui.draggable;
					var content = $(this);

					/*=============================================
			    	Traemos elemento desde base de datos
			    	=============================================*/

					var data = new FormData();
					data.append("idModule", $(idModule).attr("idModule"));

					$.ajax({

				  		url: "/ajax/grid.ajax.php",
				  		method: "POST",
				  		data: data,
				  		contentType: false,
				  		cache: false,
				  		processData: false,
				  		success: function (response){ 

				  			/*=============================================
				  			Módulos de columnas
				  			=============================================*/

				  			if($(idModule).attr("idCategory") == 2 && response == ""){

				  				var columns = $(idModule).attr("nameModule").split(' ');

				  				if(columns[columns.length-1] == ""){

				  					columns.pop();
				  				}

				  				var htmlColumns = "";

				  				if(columns[0] > 0){
				  				
					  				for(var i = 0; i < columns.length; i++){

					  					htmlColumns += `<div class="col-12 col-lg-${columns[i]}  editContent">
											
															<div class="btnContent-left">
																<span>Column</span>
															</div>

															<div class="btnContent-right px-1">
																<button class="btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground"><i class="far fa-image"></i></button>
																<button class="btn bg-white border btn-sm py-0 px-1 mr-1 noBackground" style="display:none"><i class="far fa-square"></i></button>
															</div>

															<div class="newContent">
														
																<h4 class="lead text-center rounded dropContent"><span data-feather="code"></span></h4>
															
															</div>

														</div>`;

					  				}

					  				response = `
					  				<div class="row editContent">
				
										<div class="btnContent-left">
											<span>Row</span>
										</div>

										<div class="btnContent-right px-1">
											<button class="btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground"><i class="far fa-image"></i></button>
											<button class="btn bg-white border btn-sm py-0 px-1 mr-1 noBackground" style="display:none"><i class="far fa-square"></i></button>
											<button class="btn bg-white border btn-sm py-0 px-1 deleteModule"><i class="fas fa-trash-alt"></i></button>
										</div>
										${htmlColumns}
									</div>
					  				`;

					  			}

				  			}

				  			/*=============================================
				  			Módulos de flex
				  			=============================================*/
				  			
				  			if($(idModule).attr("idCategory") == 3 && response == ""){

				  				var typeFlex = $(idModule).find(".changeFlex");
				  				
				  				var classFlex = "";

				  				typeFlex.each((i)=>{

				  					if($(typeFlex[0]).val() == ""){

				  						$(typeFlex[0]).val("justify-content-start") 
				  					}

				  					if($(typeFlex[1]).val() == ""){

				  						$(typeFlex[1]).val("align-content-start") 
				  					}

				  					classFlex += " "+$(typeFlex[i]).val()+" ";
				  					
				  				})

				  				response = `
				  					<div class="d-flex flex-wrap ${classFlex} editContent" style="height:450px">
		
										<div class="btnContent-left">
											<span>Flex</span>
										</div>

										<div class="btnContent-right px-1">
											<button class="btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground"><i class="far fa-image"></i></button>
											<button class="btn bg-white border btn-sm py-0 px-1 mr-1 noBackground" style="display:none"><i class="far fa-square"></i></button>
											<button class="btn bg-white border btn-sm py-0 px-1 deleteModule"><i class="fas fa-trash-alt"></i></button>
										</div>

										<div class="m-0 editContent">
											
											<div class="btnContent-left">
												<span>Item</span>
											</div>

											<div class="btnContent-right px-1">
												<button class="btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground"><i class="far fa-image"></i></button>
												<button class="btn bg-white border btn-sm py-0 px-1 mr-1 noBackground" style="display:none"><i class="far fa-square"></i></button>
											</div>

											<div class="newContent">
										
												<h4 class="lead text-center rounded dropContent"><span data-feather="code"></span></h4>
											
											</div>

										</div>

										<div class="m-0 editContent">
											
											<div class="btnContent-left">
												<span>Item</span>
											</div>

											<div class="btnContent-right px-1">
												<button class="btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground"><i class="far fa-image"></i></button>
												<button class="btn bg-white border btn-sm py-0 px-1 mr-1 noBackground" style="display:none"><i class="far fa-square"></i></button>
											</div>

											<div class="newContent">
										
												<h4 class="lead text-center rounded dropContent"><span data-feather="code"></span></h4>
											
											</div>

										</div>

										<div class="m-0 editContent">
											
											<div class="btnContent-left">
												<span>Item</span>
											</div>

											<div class="btnContent-right px-1">
												<button class="btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground"><i class="far fa-image"></i></button>
												<button class="btn bg-white border btn-sm py-0 px-1 mr-1 noBackground" style="display:none"><i class="far fa-square"></i></button>
											</div>

											<div class="newContent">
										
												<h4 class="lead text-center rounded dropContent"><span data-feather="code"></span></h4>
											
											</div>

										</div>

										
									</div>`;

				  			}

				  			/*=============================================
				  			Módulos de elementos
				  			=============================================*/

				  			if($(idModule).attr("idCategory") == 4){

				  				var alignElement = $(idModule).find(".changeElement").val();
				  				
				  				if(alignElement != "text-start"){

				  					response = response.replace("text-start", alignElement);
				  				}

				  			}

				  			/*=============================================
				  			Módulos de navegación
				  			=============================================*/

				  			if($(idModule).attr("idCategory") == 5){

				  				var alignNav = $(idModule).find(".changeNav").val();

				  				if($(idModule).attr("nameModule") == "H Nav"){

				  					if(alignNav != "me-auto"){

					  					response = response.replace("me-auto", alignNav);
					  				}

				  				}

				  				if($(idModule).attr("nameModule") == "V Nav"){

				  					if(alignNav != "text-start"){

					  					response = response.replace("text-start", alignNav);
					  				}
				  					
				  				}
				  				
				  			}

				  			/*=============================================
				  			Resto de Módulos
				  			=============================================*/

				  			$(content).before(response);

				  			feather.replace({ 'aria-hidden': 'true' });

				  			reloadNewContent();

				  		}

				  	})

				}
			});

		})
	}

}

/*=============================================
Cambiar número de columnas
=============================================*/

$(document).on("change",".changeNumber",function(){

	var group = $(".group"+$(this).attr("group"));
	var total = 0;
	var nameModule = "";

	group.each((i)=>{

		total += Number($(group[i]).val());

		if(Number($(group[i]).val()) > 0){

			nameModule += $(group[i]).val()+" ";
		}
		

	})

	if(total != 12){

		$(".move"+$(this).attr("group")).hide();
		$(group).css({"background":"rgba(255,0,0,.5)"});
		$(group).parent().attr("nameModule", "0");
	
	}else{

		$(".move"+$(this).attr("group")).show();
		$(group).css({"background":"transparent","border-color":"#aaa"});
		$(group).parent().attr("nameModule", nameModule);
	}

})

/*=============================================
Borrar el tablero
=============================================*/

$(document).on("click",".deleteModules", function(){

	fncSweetAlert("confirm","¿Está seguro de borrar el tablero?","").then(resp=>{

		if(resp){

			$("#builderContent").html(`

				<div class="newContent">
					
					<h4 class="lead text-center my-3 rounded  dropContent"><span data-feather="code"></span></h4>
				
				</div>

			 `)

			feather.replace({ 'aria-hidden': 'true' });

			$(".codeView").hide();
			$("#builderContent").show();
			$(".showCode").show();
			$(".showTemplate").hide();

			reloadNewContent();
		}


	})

})

/*=============================================
Guardar el Grid
=============================================*/

$(document).on("click",".saveGrid", function(){

	$(this).html(`<span class="spinner-border spinner-border-sm text-muted"></span> Guardando`)

	var codeGrid = $("#builderContent").html();
	var urlLanding = $(this).attr("urlLanding");
	var nameGrid = $(this).attr("name");

	var data = new FormData();
	data.append("nameGrid", nameGrid);
	data.append("codeGrid", codeGrid);
	data.append("token", localStorage.getItem("token-admin"));

	$.ajax({

		url: "/ajax/grid.ajax.php",
		method: "POST",
		data: data,
		contentType: false,
		cache: false,
		processData: false,
		success: function (response){  
					
			if(response == 200 && nameGrid != 0){

				$(".saveGrid").html(`<i class="fas fa-save me-1"></i> Guardar Grid`);
				fncToastr("success", "¡Cambios guardados correctamente!");		

			}else{

				$(".saveGrid").html(`<i class="fas fa-save me-1"></i> Guardar Grid`);
				window.location = "/code/"+urlLanding+"?grid=active&name="+response;

			}
	
		}

	})

})

/*=============================================
Eliminar el Grid
=============================================*/

$(document).on("click",".deleteGrid",function(){

	var nameGrid = $(this).attr("nameGrid");
	var urlLanding = $(this).attr("urlLanding")

	fncSweetAlert("confirm","¿Está seguro de borrar este Grid?","").then(resp=>{
   
	    if(resp){

	    	fncMatPreloader("on");
			fncSweetAlert("loading", "Eliminando Grid...", "");

			var data = new FormData();
			data.append("nameGridDelete", nameGrid);
			data.append("token", localStorage.getItem("token-admin"));

			$.ajax({

				url: "/ajax/grid.ajax.php",
				method: "POST",
				data: data,
				contentType: false,
				cache: false,
				processData: false,
				success: function (response){  

					if(response == 200){

						fncSweetAlert("success", "¡El grid ha sido eliminado correctamente!","/code/"+urlLanding+"?grid=active");
					}
				}

			})

	    }

	})
})




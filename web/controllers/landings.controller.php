<?php 

class LandingsController{

	/*=============================================
	Gestión de Landings
	=============================================*/

	public function landingsManage(){

		if(isset($_POST["title_landing"])){

			echo '<script>
				fncMatPreloader("on");
				fncSweetAlert("loading", "Gestionando registro...", "");
			</script>';

			/*=============================================
			Agrupar varios Items para BD
			=============================================*/
			
			$pluginsList = json_decode($_POST["pluginsList"]);
			$plugins_landing = array();

			foreach ($pluginsList as $key => $value) {

				if(!empty($_POST["plugins_landing".$value])){
				
					$plugins_landing[$key] = urlencode($_POST["plugins_landing".$value]);

				}
				
			}

			if(isset($_POST["idLanding"])){

				/*=============================================
				Solicitud a la API para actualizar registro
				=============================================*/

				$url = "landings?id=".$_POST["idLanding"]."&nameId=id_landing&token=".$_SESSION["admin"]->token_admin."&table=admins&suffix=admin";
				$method = "PUT";
				$fields = "domain_landing=".trim($_POST["domain_landing"])."&plugins_landing=".urlencode(json_encode($plugins_landing))."&icon_landing=".trim($_POST["icon_landing"])."&cover_landing=".trim($_POST["cover_landing"])."&description_landing=".trim($_POST["description_landing"]);

				$update = CurlController::request($url,$method,$fields);

				if($update->status == 200){

					echo '<script>
						
						fncMatPreloader("off");
						fncFormatInputs();
						fncSweetAlert("success", "Registro actualizado con éxito", "'.$_SERVER["REQUEST_URI"].'");

					</script>';

				}else{

					echo '<script>

					fncMatPreloader("off");
					fncFormatInputs();
					fncSweetAlert("error", "Error al actualizar el registro", "'.$_SERVER["REQUEST_URI"].'");

					</script>';
				}


			}else{

				/*=============================================
				Solicitud a la API para guardar registros
				=============================================*/
				
				$url = "landings?token=".$_SESSION["admin"]->token_admin."&table=admins&suffix=admin";
				$method = "POST";
				$fields = array(
				
					"title_landing" => trim($_POST["title_landing"]),
					"url_landing" => $_POST["url_landing"],
					"plugins_landing" => json_encode($plugins_landing),
					"icon_landing" => trim($_POST["icon_landing"]),
					"cover_landing" => trim($_POST["cover_landing"]),
					"description_landing" => trim($_POST["description_landing"]),
					"date_created_landing" => date("Y-m-d")
				);

				$save = CurlController::request($url,$method,$fields);

				if($save->status == 200){

					$url = "codes?token=".$_SESSION["admin"]->token_admin."&table=admins&suffix=admin";
					$method = "POST";
					$fields = array(
						"id_landing_code" => $save->results->lastId,
						"date_created_code" => date("Y-m-d")
					);

					$createCode = CurlController::request($url,$method,$fields);

					if($createCode->status == 200){

						echo '<script>
						
						fncMatPreloader("off");
						fncFormatInputs();
						fncSweetAlert("success", "Registro guardado con éxito", "/");

						</script>';

					}

				}else{

					echo '<script>

					fncMatPreloader("off");
					fncFormatInputs();
					fncSweetAlert("error", "Error al guardar el registro", "/");

					</script>';
				}

			}

		}

	}

}
<?php 

class AdminsController{

	/*=============================================
	Login de adminstradores
	=============================================*/	

	public function login(){

		if(isset($_POST["email_admin"])){

			$url = "admins?login=true&suffix=admin";
			$method = "POST";
			$fields = array(

				"email_admin" => $_POST["email_admin"],
				"password_admin" => $_POST["password_admin"]

			);

			$login = CurlController::request($url,$method,$fields);
			
			
			if($login->status == 200){

				$_SESSION["admin"] = $login->results[0];
				
				echo '<script>

				localStorage.setItem("token-admin","'.$login->results[0]->token_admin.'");
				window.location = "/";

				</script>';

			}else{

				$error = null;

				if($login->results == "Wrong email"){

					$error = "Correo mal escrito";

				}else{

					$error = "Contraseña mal escrita";

				}

				echo '<div class="alert alert-danger mt-3">Error al ingresar: '.$error.'</div>';

			}

		}


	}


}

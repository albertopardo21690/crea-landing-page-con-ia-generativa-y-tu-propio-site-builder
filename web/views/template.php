<?php 

/*=============================================
Iniciar variables de sesión
=============================================*/

ob_start();
session_start();

/*=============================================
Zona Horaria
=============================================*/

date_default_timezone_set("Europe/Madrid");

/*=============================================
Validar si el token está expirado
=============================================*/

if(isset($_SESSION["admin"])) {

	$url = "admins?id=".$_SESSION["admin"]->id_admin."&nameId=id_admin&token=".$_SESSION["admin"]->token_admin."&table=admins&suffix=admin";
	$method = "PUT";
	$fields = "date_update_admin=".date("Y-m-d G:i:s");

	$update = CurlController::request($url,$method,$fields);

	if($update->status == 303) {

		session_destroy();

		echo '<script>
		
			window.location = "/logout";

		</script>';

		return;

	}

}

/*=============================================
Capturar las rutas de la URL
=============================================*/ 

$routesArray = explode("/",$_SERVER["REQUEST_URI"]);
array_shift($routesArray);

foreach ($routesArray as $key => $value) {	
	$routesArray[$key] = explode("?",$value)[0];
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>

	<link href="/views/assets/plugins/bootstrap5/bootstrap.min.css" rel="stylesheet" >
	<link rel="stylesheet" href="/views/assets/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" href="/views/assets/plugins/material-preloader/material-preloader.css">
	<link rel="stylesheet" href="/views/assets/css/dashboard/dashboard.css">
	<link rel="stylesheet" href="/views/assets/css/template/template.css">

	<script src="/views/assets/js/alerts/alerts.js"></script>

	<!-- jQuery library -->
	<script src="/views/assets/plugins/jquery/jquery.min.js"></script>

	<!-- https://www.w3schools.com/bootstrap5 -->
	<script src="/views/assets/plugins/bootstrap5/bootstrap.bundle.min.js"></script>
	
	<!-- https://feathericons.com/ -->
	<script src="/views/assets/plugins/feathericons/feather.min.js"></script>

	<!-- https://sweetalert2.github.io/ -->
	<script src="/views/assets/plugins/sweetalert/sweetalert.min.js"></script>

	<!-- https://codeseven.github.io/toastr/demo.html -->
	<script src="/views/assets/plugins/toastr/toastr.min.js"></script>

	<!-- https://materializecss.com/preloader.html -->
	<script src="/views/assets/plugins/material-preloader/material-preloader.js"></script>

</head>
<body>

	<?php include "modules/header.php"; ?>
	<?php include "modules/sidebar-left.php"; ?>

	<div class="container-fluid">
		
		<div class="row">
			
			<main class="col-12 px-md-4">

				<?php 

				if (!empty($routesArray[0])){

					if($routesArray[0] == "login" || $routesArray[0] == "logout"){

						include "pages/".$routesArray[0]."/".$routesArray[0].".php";

					}else{

						include "pages/home/home.php";
					}

				}else{

					include "pages/home/home.php";

				}

			    ?>

			</main>

		</div>

	</div>

	<?php include "modules/modal-landing.php" ?>

<script src="/views/assets/js/dashboard/dashboard.js"></script>
<script src="/views/assets/js/forms/forms.js"></script>
</body>
</html>
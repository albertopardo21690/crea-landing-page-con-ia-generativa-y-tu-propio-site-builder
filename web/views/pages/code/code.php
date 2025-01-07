<link rel="stylesheet" href="/views/assets/css/code/code.css">

<?php 

include "views/modules/buttons.php";

if (isset($_GET["grid"]) && $_GET["grid"] == "active") {
	
	include "views/pages/grid/grid.php";
	
}else{

	include "modules/columns.php";

}

?>

<script src="/views/assets/js/code/code.js"></script>


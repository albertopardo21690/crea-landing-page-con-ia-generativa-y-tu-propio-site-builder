<?php

/*=============================================
Capturar las rutas de la URL
=============================================*/

$routesArray = explode("/", $_SERVER['REQUEST_URI']);
array_shift($routesArray);

foreach($routesArray as $key => $value) {
    
    $routesArray[$key] = explode("?", $value)[0];

}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- https://www.w3schools.com/bootstrap5/ -->
    <link rel="stylesheet" href="/views/assets/plugins/bootstrap5/bootstrap.min.css">
    <link rel="stylesheet" href="/views/assets/css/dashboard/dashboard.css">

    <script src="/views/assets/plugins/bootstrap5/bootstrap.bundle.min.js"></script>

    <!-- https://feathericons.com/ -->
    <script src="/views/assets/plugins/feathericons/feather.min.js"></script>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="/views/assets/css/template/template.css">

</head>

<body>

    <?php include "modules/header.php"; ?>
    <?php include "modules/sidebar-left.php"; ?>

    <div class="container-fluid">
        <div class="row">
            
            <main class="col-lg-12 px-md-4">

                <?php 
                
                    if(!empty($routesArray[0])) {

                        if($routesArray[0] == "login") {

                            include "pages/".$routesArray[0]."/".$routesArray[0].".php";

                        } else {

                            include "pages/home/home.php";

                        }

                    } else {

                        include "pages/home/home.php";
                        
                    }
                
                ?>
                
            </main>

        </div>
    </div>
    
    <script src="/views/assets/js/dashboard/dashboard.js"></script>

</body>

</html>
<?php

class AdminsController {

    /*=============================================
    Login de administradores
    =============================================*/

    public function login() {

        if(isset($_POST["email_admin"])) {

            $url = "admins?login=true&suffix=admin";
            $method = "POST";
            $fields = array(
                "email_admin" => $_POST["email_admin"],
                "password_admin" => $_POST["password_admin"]
            );

            $login = CurlController::request($url, $method, $fields);

            if($login->status == 200) {

                $_SESSION["admin"] = $login->results[0];

                echo '<script>
                    window.location = "/";
                </script>';

            } else {

                $error = null;

                if($login->results == "Wrong email") {

                    $error = "El email esta mal escrito";

                } else {

                    $error = "La contraseña esta mal escrita";

                }

                echo "<div class='alert alert-danger mt-3'>".$error."</div>";

            }

        }
        
    }

}
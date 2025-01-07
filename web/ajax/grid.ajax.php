<?php

require_once "../controllers/template.controller.php";
require_once "../controllers/curl.controller.php";


class GridController{

	/*=============================================
	Limpiar el HTML de Bootstrap
	=============================================*/
 
    public $code;

    public function htmlClean(){

    	echo TemplateController::htmlClean($this->code);

    }

    /*=============================================
	Traer módulos
	=============================================*/

	public $idModule;

	public function getModule(){

		$url = "modules?linkTo=id_module&equalTo=".$this->idModule."&select=code_module";
		$method = "GET";
		$fields = array();

		$module = CurlController::request($url,$method,$fields);

		if($module->status == 200){

			echo $module->results[0]->code_module;
		}

	}

	/*=============================================
	Guardar Grid
	=============================================*/
	public $nameGrid;
	public $codeGrid;
	public $token;

	public function saveGrid(){

		if($this->nameGrid == 0){

			$url = "grids?token=".$this->token."&table=admins&suffix=admin";
			$method = "POST";
			$fields = array(
				"name_grid"=>uniqid(),
				"code_grid"=>TemplateController::htmlClean(trim($this->codeGrid)),
				"date_created_grid"=>date("Y-m-d")
			);

			$grid = CurlController::request($url,$method,$fields);

			if($grid->status == 200){

				echo $fields["name_grid"];

			}

		}else{

			$url = "grids?id=".$this->nameGrid."&nameId=name_grid&token=".$this->token."&table=admins&suffix=admin";
			$method = "PUT";
			$fields = "code_grid=".TemplateController::htmlClean(trim(urlencode($this->codeGrid)));

			$grid =  CurlController::request($url,$method,$fields);

			if($grid->status == 200){

				echo $grid->status;

			}

		}

	}

	/*=============================================
	Eliminar Grid
	=============================================*/

	public $nameGridDelete;

	public function deleteGrid(){


		$url = "grids?id=".$this->nameGridDelete."&nameId=name_grid&token=".$this->token."&table=admins&suffix=admin";
    	$method = "DELETE";
    	$fields =  array();

    	$deleteGrid = CurlController::request($url, $method, $fields);

    	if($deleteGrid->status == 200){

    		echo $deleteGrid->status;
    	}

	}

}

if(isset($_POST["code"])){

	$ajax = new GridController();
	$ajax -> code = $_POST["code"];
	$ajax -> htmlClean();
}

if(isset($_POST["idModule"])){

	$ajax = new GridController();
	$ajax -> idModule = $_POST["idModule"];
	$ajax -> getModule();
}

if(isset($_POST["codeGrid"])){

	$ajax = new GridController();
	$ajax -> nameGrid = $_POST["nameGrid"];
	$ajax -> codeGrid = $_POST["codeGrid"];
	$ajax -> token = $_POST["token"];
	$ajax -> saveGrid();

}

if(isset($_POST["nameGridDelete"])){

	$ajax = new GridController();
	$ajax -> nameGridDelete = $_POST["nameGridDelete"];
	$ajax -> token = $_POST["token"];
	$ajax -> deleteGrid();

}



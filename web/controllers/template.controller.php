<?php 

class TemplateController{

	/*=============================================
	Traemos la Vista Principal de la plantilla
	=============================================*/

	public function index(){

		include "views/template.php";
	}

	/*=============================================
	Función Limpiar HTML
	=============================================*/

	static public function htmlClean($code){

		$search = array('/\>[^\S ]+/s','/[^\S ]+\</s','/(\s)+/s');
		$replace = array('>','<','\\1');

		$code = preg_replace($search, $replace, $code);

		$code = str_replace("><",">\n\n<", $code);
		$code = str_replace("> <",">\n\n<", $code);

		return $code;
	}	

}


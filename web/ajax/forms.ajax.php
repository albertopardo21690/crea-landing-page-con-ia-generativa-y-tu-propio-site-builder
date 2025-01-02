<?php 

require_once "../controllers/curl.controller.php";

class FormsController{

	/*=============================================
   	Validar títulos repetidos
    =============================================*/

    public $table;
    public $equalTo;
    public $linkTo;

    public function ajaxForms(){

    	$url = $this->table."?linkTo=".$this->linkTo."&equalTo=".urlencode($this->equalTo)."&select=".$this->linkTo;
    	$method = "GET";
    	$fields = array();

    	$data = CurlController::request($url,$method,$fields);
    	echo $data->status;

    }

}

if(isset($_POST["table"])){

	$ajax = new FormsController();
	$ajax -> table = $_POST["table"];
	$ajax -> equalTo = $_POST["equalTo"];
	$ajax -> linkTo = $_POST["linkTo"];
	$ajax -> ajaxForms();

}


?>
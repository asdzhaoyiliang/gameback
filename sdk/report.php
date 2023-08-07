<?php
header("Content-type: text/html; charset=utf8");
header('Access-Control-Allow-Origin:*');    
header('Access-Control-Allow-Methods:GET');   
header('Access-Control-Allow-Headers:x-requested-with,content-type');
	
require_once 'conf/main.php';

class report{

    public  function run($param) {

    }
}
$param  = addslashes_deep($_REQUEST);
(new report()) -> run($param);

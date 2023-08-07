<?php
	include "common.php";
	header('Access-Control-Allow-Origin:*');    
	header('Access-Control-Allow-Methods:GET');   
	header('Access-Control-Allow-Headers:x-requested-with,content-type'); 

	define('WWW_PATH',str_replace('\\','/',realpath(dirname(__FILE__).'/../'))); 
	function logMsg($str){
		file_put_contents("sdklog.txt", "[". date("Y-m-d H:i:s") . "]". $str ."\r\n" ,  FILE_APPEND );
	}
	logMsg($_REQUEST['msg']);
?>

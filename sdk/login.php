<?php
	include "common.php";
	header('Access-Control-Allow-Origin:*');    
	header('Access-Control-Allow-Methods:GET');   
	header('Access-Control-Allow-Headers:x-requested-with,content-type'); 

	define('WWW_PATH',str_replace('\\','/',realpath(dirname(__FILE__).'/../'))); 
	function logMsg($str){
		file_put_contents("xq.txt", "[". date("Y-m-d H:i:s") . "]". $str ."\r\n" ,  FILE_APPEND );
	}
	
	$paramArr=array();
	$appkey="a3b8ed3bb6fb67aba3d219184043dfef";
	$paramArr['tokenkey']= $_REQUEST['tokenkey'];
	$paramArr['sign']=md5($appkey.$paramArr['tokenkey']);
	$url="https://api.x7sy.com/user/check_login";
	$data=sendCurlGet($url,$paramArr);
	echo $data;
	logMsg($url."?tokenkey=".$paramArr['tokenkey']."&sign=".$paramArr['sign']);

?>

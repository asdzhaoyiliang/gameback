<?php
header("Content-type: text/html; charset=utf8");
header('Access-Control-Allow-Origin:*');    
header('Access-Control-Allow-Methods:GET');   
header('Access-Control-Allow-Headers:x-requested-with,content-type');
ini_set('display_errors', 'off');
error_reporting(E_ALL ^ E_NOTICE ^ E_DEPRECATED);

define('ROOT',str_replace('\\','/',realpath(dirname(__FILE__).'/'))."/");
require_once ROOT . '/includes/define.inc.php';
require_once ROOT . '/includes/database.inc.php';

//ini_set('display_errors', 'On');
//error_reporting(E_ALL ^ E_NOTICE);
//ini_set('mongo.long_as_object', 1);

ini_set("display_errors","Off");
error_reporting(E_ERROR); 


date_default_timezone_set('Asia/Chongqing');

spl_autoload_register('autoload');
function autoload($className) {
    if (strpos($className, 'PHPExcel_') === 0) return;
    $path = array(
        get_include_path(),
        ROOT . '/model',
        ROOT . '/api',
    );
    set_include_path(implode(PATH_SEPARATOR, $path));
    @include_once "$className.php";
}


class cdkey{
	public  function run($param) {
		$cdkey = new CdkeyController();
		$cdkey->check_key();
	}
}
(new cdkey()) -> run($_REQUEST);

<?php
header("Content-type: text/html; charset=utf8");
header('Access-Control-Allow-Origin:*');    
header('Access-Control-Allow-Methods:GET');   
header('Access-Control-Allow-Headers:x-requested-with,content-type');

define('ROOT',str_replace('\\','/',realpath(dirname(__FILE__).'/'))."/");
require_once ROOT . '/includes/define.inc.php';
require_once ROOT . '/includes/database.inc.php';

//ini_set('display_errors', 'On');
//error_reporting(E_ALL ^ E_NOTICE);
//ini_set('mongo.long_as_object', 1);
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


class notice{
	public  function run($param) {
		$notice = new NoticeController();
		$notice->get_notice();
	}
}
(new notice()) -> run($_REQUEST);

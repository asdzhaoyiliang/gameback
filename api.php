<?php
/**
 * 接口入口文件，控制器在./controller/api/下
 * url: 域名 + /hhsy/center/api.php?r=控制器名/动作名， 如 foo.com/hhsy/center/api.php?r=regstat/index
 *
 */

header('Content-type:text/html;charset=UTF-8');
define('ROOT', __DIR__);
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

$r = $_GET['r'] ? $_GET['r'] : ($_POST['r'] ? $_POST['r'] : FALSE);
if( !$r )  exit('Controller is null');

$splits = explode('/', $r);
$splits[1] || $splits[1] = 'index';

$controller = ucfirst(strtolower($splits[0])) . 'Controller';
$action =  ucfirst($splits[1]);


if (!class_exists($controller)) exit("{$controller} is not exists!");
if (!method_exists($controller, $action)) exit("{$action} is not exists!");

$c = new $controller();
if ($c instanceof ApiController) $c->$action();

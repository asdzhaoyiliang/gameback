<?php

$ctrl = isset($_GET['ctrl']) ? trim($_GET['ctrl']) : 'index';
$act = isset($_GET['act']) ? trim($_GET['act']) : 'index';

if(preg_match("/[^0-9a-z_]/i", $ctrl)){
	write_error_log(json_encode(array('session' => $_SESSION, 'server' => $_SERVER, 'request' => $_REQUEST)), 'hack');
	session_destroy();
	exit('520');
}


//权限判断
$result = has_purview($ctrl, $act);
switch ($result){
    case 1:
        break;
    case -1:
        header("Location:".LOGIN_URL);//未登录，跳转登录页面
        exit();
    case -2:
        show_403_page('不可访问的ip');
        break;
    case -3:
        show_403_page('没有访问权限');
        break;
    case -4:
        show_403_page('用户状态异常');
        break;
    default:
        show_404_page();
        break;
}

//分析路径，引入控制层
$ctrlClassName = _to_lower_and_ucfirst($ctrl)."Controller";
$ctrlFileName = ROOT . "/control/{$ctrlClassName}.class.php";

$Controller = new $ctrlClassName();
if (method_exists($Controller, $act)) {
    $Controller->$act();
} else {
    throw new Exception("Not exists function $act() in class $ctrlClassName");
}

router_destruct();
function router_destruct(){
}
function _to_lower_and_ucfirst ($str) {
    return ucfirst(strtolower($str));
}
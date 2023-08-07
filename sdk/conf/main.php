<?php
/**
 * Created by PhpStorm.
 * User: lsq
 * Date: 14-8-8
 * Time: 下午3:38
 */

header('Content-type:text/html;charset=UTF-8');
define('ROOT', __DIR__);

require_once ROOT . '/../../includes/define.inc.php';
require_once ROOT . '/../../includes/database.inc.php';

ini_set('display_errors', 'on');
error_reporting(E_ALL ^ E_NOTICE ^ E_DEPRECATED);
date_default_timezone_set('Asia/Chongqing');

$dirs = array(
    __DIR__,
    ROOT . '/../../component',
    ROOT . '/../../model',
    ROOT . '/../login',
);

set_include_path(implode(PATH_SEPARATOR, $dirs));

function autoload($className) {
    @include_once "$className.php";
}
spl_autoload_register('autoload');

function exhandler(Exception $e) {
    trigger_error($e->getMessage() . $e->getTraceAsString(), E_USER_ERROR);
}
set_exception_handler('exhandler');



/**
 * 获取用户ip
 * @return string
 */
function get_ip() {
    if ($ip = getenv('HTTP_CLIENT_IP'));
    elseif ($ip = getenv('HTTP_X_FORWARDED_FOR'));
    elseif ($ip = getenv('HTTP_X_FORWARDED'));
    elseif ($ip = getenv('HTTP_FORWARDED_FOR'));
    elseif ($ip = getenv('HTTP_FORWARDED'));
    else    $ip = $_SERVER['REMOTE_ADDR'];
    return  $ip;
}

function _RunMagicQuotes(&$svar)
{
    if(!get_magic_quotes_gpc())
    {
        if( is_array($svar) )
        {
            foreach($svar as $_k => $_v) $svar[$_k] = _RunMagicQuotes($_v);
        }
        else
        {
            if( strlen($svar)>0 && preg_match('#^(cfg_|GLOBALS|_GET|_POST|_COOKIE|_SESSION)#',$svar) )
            {
              exit('Request var not allow!');
            }
            $svar = addslashes($svar);
        }
    }
    return $svar;
}

if(!defined('REQUEST'))
{
    //检查和注册外部提交的变量   (2011.8.10 修改登录时相关过滤)
    function CheckRequest(&$val) {
        if (is_array($val)) {
            foreach ($val as $_k=>$_v) {
                if($_k == 'nvarname') continue;
                CheckRequest($_k);
                CheckRequest($val[$_k]);
            }
        } else
        {
            if( strlen($val)>0 && preg_match('#^(cfg_|GLOBALS|_GET|_POST|_COOKIE|_SESSION)#',$val)  )
            {
                exit('Request var not allow!');
            }
        }
    }

    CheckRequest($_REQUEST);
	CheckRequest($_COOKIE);

    foreach(Array('_GET','_POST','_COOKIE') as $_request)
    {
        foreach($$_request as $_k => $_v)
		{
			if($_k == 'nvarname') ${$_k} = $_v;
			else ${$_k} = _RunMagicQuotes($_v);
		}
    }
}

function addslashes_deep($value)
{
	if(empty($value))
	{
		return $value;
	}
	else
	{
		return is_array($value) ? array_map('addslashes_deep', $value) : addslashes($value);
	}
}



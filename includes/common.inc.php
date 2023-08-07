<?php

//计划任务只能够在命令行模式下执行
if(defined("NAME_PHP_SAPI") && NAME_PHP_SAPI == "cli" && substr(php_sapi_name(), 0, 3) != 'cli'){
    exit("403");
}

require_once (ROOT . '/includes/define.inc.php');//引入预定义常量
require_once (ROOT . '/includes/database.inc.php');//引入数据库mysqli类
require_once (ROOT . '/includes/translate.inc.php');//引入翻译相关方法

ini_set('display_errors', is_dev() ? 'On' : 'Off');
error_reporting(E_ALL ^ E_NOTICE ^ E_DEPRECATED);

spl_autoload_register('__autoload');
spl_autoload_register('autoload');

/**
 * 设置错误处理和异常处理的方法
 * 写入日志
 */
set_error_handler('error_handler');
set_exception_handler('exception_handler');

session_start();
header("Content-type: text/html;charset=UTF-8");
//根据配置文件设置时区
$timezone = TIMEZONE;
date_default_timezone_set($timezone);

function print_page () {
    require_once (ROOT . '/includes/smarty.inc.php');
    require_once (ROOT . '/includes/router.inc.php');
}

/**
 * 使用反斜线引用字符串
 * @param $string
 * @return array|string
 */
function _addslashes ($string) {
    if (is_array($string)) {
        $keys = array_keys($string);
        foreach ($keys as $key) {
            $val = $string[$key];
            unset($string[$key]);
            $string[addslashes($key)] = _addslashes($val);
        }
    } else {
        $string = addslashes($string);
    }
    return $string;
}

function __autoload ($className) {
    $info = _class_name_info($className);
    $classPath = ROOT . "/{$info['folder']}/{$className}.class.php";
    if (is_file($classPath)) {
        require_once ($classPath);
    }
}

function autoload($className) {
    if (strpos($className, 'PHPExcel_') === 0) return;
    $path = array(
        get_include_path(),
        ROOT . '/model',
        ROOT . '/component',
        ROOT.'/controller/cron',
        ROOT . '/library/PHPExcel',
    );
    set_include_path(implode(PATH_SEPARATOR, $path));

    require_once "$className.php";
}

function _class_name_info ($className) {
    $strlen = strlen($className);
    $tmp_arr = $info = array();
    if ($strlen > 0) {
        $tmp = '';
        for ($i = 0; $i < $strlen; $i ++) {
            $tmpChar = $className[$i];
            if ($tmpChar == strtoupper($tmpChar)) {
                $tmp && $tmp_arr[] = $tmp;
                $tmp = $tmpChar;
            } else {
                $tmp .= $tmpChar;
            }
        }
        $info['folder'] = strtolower($tmp);
        $info['filename'] = $className;
    }
    return $info;
}

function random ($length, $numeric = 0) {
    if ($numeric) {
        $hash = sprintf('%0' . $length . 'd', mt_rand(0, pow(10, $length) - 1));
    } else {
        $hash = '';
        $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
        $max = strlen($chars) - 1;
        for ($i = 0; $i < $length; $i ++) {
            $hash .= $chars[mt_rand(0, $max)];
        }
    }
    return $hash;
}

function check_post ($fields = array()) {
    if ($fields) {
        foreach ($fields as $f) {
            $value = trim($_POST[$f]);
            if ($value == '') {return $f;}
        }
    }
    return '1';
}

/**
 * 截取中文字符串
 * @param $text
 * @param $start
 * @param null $length
 * @param int $ex
 * @return string
 */
function chinese_substr ($text, $start, $length = NULL, $ex = 2) {
    $strlen = strlen($text);
    // Find the starting byte offset
    $bytes = 0;
    if ($start > 0) {
        // Count all the continuation bytes from the start until we have found
        // $start characters
        $bytes = - 1;
        $chars = - 1;
        while ($bytes < $strlen && $chars < $start) {
            $bytes ++;
            $c = ord($text[$bytes]);
            if ($c < 0x80 || $c >= 0xC0) {
                if ($c >= 0xC0) {
                    $chars += $ex;
                } else {
                    $chars ++;
                }
            }
        }
    } else if ($start < 0) {
        // Count all the continuation bytes from the end until we have found
        // abs($start) characters
        $start = abs($start);
        $bytes = $strlen;
        $chars = 0;
        while ($bytes > 0 && $chars < $start) {
            $bytes --;
            $c = ord($text[$bytes]);
            if ($c < 0x80 || $c >= 0xC0) {
                if ($c >= 0xC0) {
                    $chars += $ex;
                } else {
                    $chars ++;
                }
            }
        }
    }
    $istart = $bytes;

    // Find the ending byte offset
    if ($length === NULL) {
        $bytes = $strlen - 1;
    } else if ($length > 0) {
        // Count all the continuation bytes from the starting index until we have
        // found $length + 1 characters. Then backtrack one byte.
        $bytes = $istart;
        $chars = 0;
        while ($bytes < $strlen && $chars < $length) {
            $bytes ++;
            $c = ord($text[$bytes]);
            if ($c < 0x80 || $c >= 0xC0) {
                if ($c >= 0xC0) {
                    $chars += $ex;
                } else {
                    $chars ++;
                }
            }
        }
        $bytes --;
    } else if ($length < 0) {
        // Count all the continuation bytes from the end until we have found
        // abs($length) characters
        $length = abs($length);
        $bytes = $strlen - 1;
        $chars = 0;
        while ($bytes >= 0 && $chars < $length) {
            $c = ord($text[$bytes]);
            if ($c < 0x80 || $c >= 0xC0) {
                if ($c >= 0xC0) {
                    $chars += $ex;
                } else {
                    $chars ++;
                }
            }
            $bytes --;
        }
    }
    $iend = $bytes;

    return substr($text, $istart, max(0, $iend - $istart + 1));
}

/**
 * 随机生成用户指定个数的字符串
 * @param int $num
 * @return string
 */
function create_rand_code ($num=6) {
    for ($i = 0; $i < $num; $i ++) {
        $number = rand(0, 2);
        switch ($number) {
            case 0:
                $rand_number = rand(48, 57);
                break; //数字
            case 1:
                $rand_number = rand(65, 90);
                break; //大写字母
            case 2:
                $rand_number = rand(97, 122);
                break; //小写字母
        }
        $ascii = sprintf("%c", $rand_number);
        $ascii_number = $ascii_number . $ascii;
    }
    return $ascii_number;
}

//判断用户是否有权限
function has_purview($ctrl, $act){
    return (new LoginModel())->hasPurview($ctrl, $act);
}

function getJson($file, $path=""){
	if(empty($path)){
		$path = ROOT."/config/json";
	}else{
		$path = rtrim($path, '/');
	}
	$content = file_get_contents("{$path}/{$file}");
// 	$content = preg_replace('/\/\*(.*?)\*\//', '', $content);//过滤格式:/* */
// 	$content = preg_replace("/\/\/(\040*)(.*?)(\040*)(.*)\s/i", '', $content);//过滤格式：// 注释内容
	$pattern = "/\/\*(\s|\S)*?\*\/|\/\/.*?(\r\n|\n|\r)/";//过滤多行和单行注释
	$content = preg_replace($pattern, "", $content);
	$getJson = json_decode($content,true);
	return $getJson;
}

/**
 *导出excel
 * @param $arr array 数据数组
 * @param $fileName string 生成的文件名
 * xxx\s123\iabc\n
 */
function fputexcel($fileName = 'excel', $arr, $type = 'array'){
	header("content-type:text/html; charset=utf-8");
	header("Content-type:application/vnd.ms-excel");
	header("Content-Disposition:attachment;filename=$fileName.xls");
	if($type == 'array'){
		$str = '';
		foreach($arr as $v1){
			$str .= '<tr>';
			foreach($v1 as $v2){
				if((string)$v2 == (string)floatval($v2)){ // 数字
					if($v2 > 4294967296){
						$str .= '<td x:str class=xl2216681 nowrap>'.$v2.'</td>';
					}else{
						$str .= '<td x:num class=xl2216681 nowrap>'.$v2.'</td>';
					}
				}else{
					$str .= '<td x:str class=xl2216681 nowrap>'.$v2.'</td>';
				}
			}
			$str .= '</tr>';
		}
		$opt='
		    <html xmlns:o="urn:schemas-microsoft-com:office:office"
		    xmlns:x="urn:schemas-microsoft-com:office:excel"
		    xmlns="http://www.w3.org/TR/REC-html40">
		    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		    <html>
		    <head>
		    <meta http-equiv="Content-type" content="text/html;charset=utf-8" />
		    <style id="Classeur1_16681_Styles"></style>
		    </head>
		    <body>
		    <div id="Classeur1_16681" align=center x:publishsource="Excel">
		    <table border=1 cellpadding=0 cellspacing=0 style="border-collapse: collapse">
		    '.$str.'
		    </table>
		    </div>
		    </body>
		    </html>';
	}else{
		$opt = $arr;
	}
	die($opt);
}

function check_plain($text) {
    static $php525;

    if (!isset($php525)) {
        $php525 = version_compare(PHP_VERSION, '5.2.5', '>=');
    }
    if ($php525) {
        return htmlspecialchars($text, ENT_QUOTES, 'UTF-8');
    }
    return (preg_match('/^./us', $text) == 1) ? htmlspecialchars($text, ENT_QUOTES, 'UTF-8') : '';
}

function textareaStrToArr($str){
    $str = trim($str);
    $str = str_replace(';',',',$str);
    $str = str_replace('；',',',$str);
    $str = str_replace('，',',',$str);
    $str = str_replace(',',"\n", $str);
    $arr = explode("\n", $str);

    $data =  array();
    //防止在windows系统下数组中的元素出现\r的情况
    foreach($arr as $tmp){
        trim($tmp) && $data[] = trim($tmp);
    }
    return $data;
}

/**
 *
 * @param $dir
 * @return bool
 */
function xmkdir($dir){
    if(!file_exists($dir)){
        $result = mkdir($dir, 0777, true);
        $cmd = "chown -R www:www {$dir}";
        pclose(popen($cmd, "w"));
        return $result;
    }else{
        return true;
    }
}

/**
 * 加密解密方法
 */
function authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) {
	$ckey_length = 8;	// 随机密钥长度 取值 0-32;
	// 加入随机密钥，可以令密文无任何规律，即便是原文和密钥完全相同，加密结果也会每次不同，增大破解难度。
	// 取值越大，密文变动规律越大，密文变化 = 16 的 $ckey_length 次方
	// 当此值为 0 时，则不产生随机密钥

	$key = md5($key ? $key : '~x*$c0!2.gI0(x&j32');
	$keya = md5(substr($key, 0, 16));
	$keyb = md5(substr($key, 16, 16));
	$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

	$cryptkey = $keya.md5($keya.$keyc);
	$key_length = strlen($cryptkey);

	$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
	$string_length = strlen($string);

	$result = '';
	$box = range(0, 255);

	$rndkey = array();
	for($i = 0; $i <= 255; $i++) {
		$rndkey[$i] = ord($cryptkey[$i % $key_length]);
	}

	for($j = $i = 0; $i < 256; $i++) {
		$j = ($j + $box[$i] + $rndkey[$i]) % 256;
		$tmp = $box[$i];
		$box[$i] = $box[$j];
		$box[$j] = $tmp;
	}

	for($a = $j = $i = 0; $i < $string_length; $i++) {
		$a = ($a + 1) % 256;
		$j = ($j + $box[$a]) % 256;
		$tmp = $box[$a];
		$box[$a] = $box[$j];
		$box[$j] = $tmp;
		$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
	}

	if($operation == 'DECODE') {
		if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
			return substr($result, 26);
		} else {
			return '';
		}
	} else {
		return $keyc.str_replace('=', '', base64_encode($result));
	}

}

/**
 * 表格生成，主题，隔行换色，行和列点击变色，必须引用jquery
 * @param $body array 二维表格内容数组，必须
 * @param $tabId string 生成的表格外嵌div的id，默认随机
 * @param $head array 表格头部数组
 * @param $head array 表格底部数组
 * @param $theme array 样式选择 '样式(blue,brown,green,gray[default])' => '格子(grid)、直线边框(line_b)、直线无边框(line)'
 * @param $Tparam array table的参数
 */
function themeTable($body, $tabId = null, $head = array(), $foot = array(), $theme = array(), $Tparam = array()){
    if(!$body && !$head && !$foot) return 'invalid data';
    if(is_array($body)){
        $id = $tabId ? $tabId : 't'.mt_rand(100, 999); // table id
        // style start
        $style = '<style>#'.$id.' th{text-align:left;}';
        $key = key($theme);
        $value = @$theme[$key];
        if($value && $value == 'line'){
            $style .= '#'.$id.'{width:100%\9; padding:4px 12px 6px 12px; margin:6px 0; border: solid 1px #####;border-radius: 5px;background: #FAFAFA;}';
            $style .= '@media screen and (-ms-high-contrast: active), (-ms-high-contrast: none){#'.$id.'{width:auto;}}'; // ie 10+ hack
            $border = 'border-bottom';
            $c_th = '#fff';
            $foot_border = 'border-bottom:none;';
        }else if($value && $value == 'line_b'){
            $border = 'border-bottom';
            $c_th = '#fff';
            $foot_border = 'border-bottom:none;';
        }else{
            $border = 'border';
            $foot_border = '';
        }
        switch($key){
            case 'blue':
                $c_border = '#b1cbe2';
                $c_odd = '#eaf2f5';
                $c_hover = '#d5e7f3';
                $c_click = '#CAE0EE';
                $c_th = @$c_th ? $c_th : '#d5e7f3';
                break;
            case 'brown':
                $c_border = '#CAA673';
                $c_odd = '#F3EDE4';
                $c_hover = '#E8DDCE';
                $c_click = '#DECAB0';
                $c_th = @$c_th ? $c_th : '#E0D2C0';
                break;
            case 'green':
                $c_border = '#75C73D';
                $c_odd = '#E4F9D7';
                $c_hover = '#CEF0B7';
                $c_click = '#C0EAA4';
                $c_th = @$c_th ? $c_th : '#BDED9D';
                break;
            case 'gray':
            default:
                $c_border = '#ABABAB';
                $c_odd = '#F5F5F5';
                $c_hover = '#EEEEEE';
                $c_click = '#E0E3E5';
                $c_th = @$c_th ? $c_th : '#E3E1E1';
        }
        $style .= '#'.$id.' table{border-collapse:collapse;border:0;margin:0;}
                   #'.$id.' th{font-weight:bold;background-color:'.$c_th.';cursor:pointer;}
                   #'.$id.' th, #'.$id.' td{'.$border.':'.$c_border.' solid 1px;padding: 8px 3px;}
                   #'.$id.' tbody tr.coolTable_even{background-color:#fff;}
                   #'.$id.' tbody tr.coolTable_odd{background-color:'.$c_odd.';}
                   #'.$id.' tbody tr.coolTable_click,#'.$id.' .coolTable_click{background:'.$c_click.';}
                   #'.$id.' tbody tr:hover{background:'.$c_hover.';}
                   #'.$id.' tfoot th{'.$foot_border.';}';
        $style .= '</style>';
        $style = str_replace('#####' , $c_border, $style);
        // style end

        // js start
        $script = '<script>$(document).ready(function(){$("#'.$id.' table tbody tr").click(function(){$(this).toggleClass("coolTable_click");});$("#'.$id.' table th").click(function(){var coolTable_index = $(this).index();$("#'.$id.' td,#'.$id.' th").each(function(){if($(this).index() === coolTable_index){$(this).toggleClass("coolTable_click");}})});});</script>';
        // js end

        // table param start
        $str = '';
        if($Tparam && is_array($Tparam)){
            foreach($Tparam as $k => $v){
                $str .= ' '.$k.'="'.$v.'" ';
            }
        }else{
            $str = 'width="100%" border="0" cellspacing="0" cellpadding="0"'; // default table style
        }
        // table param end
        $ret = $style.$script.'<div id="'.$id.'"><table '.$str.'>';

        // head start
        if($head && is_array($head)){
            $ret .= '<thead><tr>';
            foreach($head as $v){
                $ret .= '<th>'.$v.'</th>';
            }
            $ret .= '</tr></thead>';
        }
        // head end

        // body start
        $ret .= '<tbody>';
        $i = 1;
        if(!empty($body)){
            foreach($body as $k1 => $v1){
                $c = ($i % 2 == 0) ? 'coolTable_odd' : 'coolTable_even' ;
                $i++;
                $ret .= '<tr class="'.$c.'">';
                foreach($v1 as $v2){
                    $ret .= '<td>'.$v2.'</td>';
                }
                $ret .= '</tr>';
            }
        }else{
            $count = null;
            if($head){
                $count = count($head);
            }elseif($foot){
                $count = count($foot);
            }
            $count && $ret .= '<tr><td colspan="'.$count.'">无数据</td></tr>';
        }
        $ret .= '</tbody>';
        // body end

        // foot start
        if($foot && is_array($foot)){
            $ret .= '<tfoot><tr>';
            foreach($foot as $v){
                $ret .= '<th>'.$v.'</th>';
            }
            $ret .= '</tr></tfoot>';
        }
        // foot end

        $ret .= '</table></div>';
        return $ret;
    }else{
        return 'body invalid';
    }
}


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
/**
 * 验证ip
 * @param $ip
 * @return bool
 */
function check_ip($ip){
    if(!preg_match("/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/", $ip)) {
        return false;
    }
    $ip_arr = explode('.', $ip);
    foreach($ip_arr as $num){
        if($num > 255) return false;
    }
    return true;
}


/**
 * 错误处理
 */
function error_handler($errno, $errstr, $errfile, $errline) {
    if ($errno == E_NOTICE || $errno == E_DEPRECATED) return true;
    $errorDir = LOG_DIR.'error/';
    if (!is_dir($errorDir))
        mkdir($errorDir);
    $msg = '[' . date('Y-m-d H:i:s') . '] ' . "$errfile line $errline: $errstr\n";
    $file = $errorDir . date('Y-m') . '_center.log';
    @file_put_contents($file, $msg, FILE_APPEND);
    return is_dev() ? false : true;
}
function exception_handler (Exception $e) {
    $msg = $e->getMessage();
    $output =  'Exception occured';
    echo is_dev() ? $output . ": $msg\n" : $output;

    $trace = $e->getTraceAsString();
    $msg = '[' . date('Y-m-d H:i:s') . "] Exception: {$msg}\nStack trace:\n$trace\n";

    $errorDir = LOG_DIR.'error/';
    if (!is_dir($errorDir))
        mkdir($errorDir);
    $file = $errorDir . date('Y-m') . '_center.log';
    @file_put_contents($file, $msg, FILE_APPEND);
}

/**
 * 数据库错误
 * @param $message
 * @param string $type
 */
function write_error_log ($message, $type='error') {
    $time = date('Y-m-d H:i:s');
    $message = "[ {$time} ] {$message}\n";

    $dir = LOG_DIR.$type;
    if(!file_exists($dir)){
        xmkdir($dir,0777);
    }

    $file = $dir.'/' . date("Y-m") . '.sql.log';
    error_log($message, 3, $file);
}
function _error_levels () {
    $types = array(
        E_ERROR             => array('Error'),
        E_WARNING           => array('Warning'),
        E_PARSE             => array('Parse error'),
        E_NOTICE            => array('Notice'),
        E_CORE_ERROR        => array('Core error'),
        E_CORE_WARNING      => array('Core warning'),
        E_COMPILE_ERROR     => array('Compile error'),
        E_COMPILE_WARNING   =>array('Compile warning'),
        E_USER_ERROR        => array('User error'),
        E_USER_WARNING      => array('User warning'),
        E_USER_NOTICE       => array('User notice'),
        E_STRICT             => array('Strict warning'),
        E_RECOVERABLE_ERROR => array('Recoverable fatal error')
    );
    // E_DEPRECATED and E_USER_DEPRECATED were added in PHP 5.3.0.
    if (defined('E_DEPRECATED')) {
        $types[E_DEPRECATED] = array('Deprecated function');
        $types[E_USER_DEPRECATED] = array('User deprecated function');
    }
    return $types;
}


/**
 * 403
 * @param null $content
 */
function show_403_page($content=null){
    echo $content? $content: '你没有权限访问该页面';
    exit();
}
/**
 * 404
 * @param null $content
 */
function show_404_page($content=null){
    echo $content? $content: 'page not found';
    exit();
}




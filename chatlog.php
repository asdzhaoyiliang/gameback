<?php
header("Content-type: text/html; charset=utf-8");
header('Access-Control-Allow-Origin:*');    
header('Access-Control-Allow-Methods:GET');   
header('Access-Control-Allow-Headers:x-requested-with,content-type');
require_once 'sdk/conf/main.php';

/*
	-- plat_id			 渠道id
	-- device_id		 设备id
	-- user_id			 用户uid
	-- server_id		 区服id
	-- role_id			 角色id
	-- role_name    	 角色名
	-- role_level       角色等级
	-- role_gold		 角色元宝
	-- chat_type        聊天类型
	-- chat_msg         聊天信息
	-- chat_role        私聊对象（角色id）
	-- role_vip         角色VIP
	-- chat_role_name   私聊对象（角色名）
	-- chat_role_level  私聊对象（角色等级）
*/

class chatlog {
	function logs($str){
		file_put_contents("chatlog.txt", "[". date("Y-m-d H:i:s") . "]". $str ."\r\n" ,  FILE_APPEND );
	}
    public  function run($data) {
		$this->logs($data);
		date_default_timezone_set('PRC');
		$params = explode("\t",$data);
		$plat_id =  addslashes_deep($params[0]);
		$plat_id =  addslashes_deep($params[1]);
		$user_id =  addslashes_deep($params[2]);
		$server_id = addslashes_deep($params[3]);
		$role_id = addslashes_deep($params[4]);
		$role_name = addslashes_deep($params[5]);
		$role_level = addslashes_deep($params[6]);
		$role_gold = addslashes_deep($params[7]);
		$chat_type = addslashes_deep($params[8]);
		$chat_msg = addslashes_deep($params[9]);
		$chat_role = addslashes_deep($params[10]);
		$role_vip = addslashes_deep($params[11]);
		$chat_role_name = addslashes_deep($params[12]);
		$chat_role_level = addslashes_deep($params[13]);
		$dt = date("Y-m-d H:i:s");
		$mysqli = new mysqli(MYSQLHOST, MYSQLUSER, MYSQLPASS, DB_NAME,MYSQLPORT);
        $mysqli->set_charset('utf8');
		$cmdsql = "INSERT INTO `bg_chatlog` (plat_id,device_id,user_id,server_id,role_id,role_name,role_level,role_gold,chat_type,chat_msg,chat_role,role_vip,chat_role_name,chat_role_level,dt) 
		   VALUES ('{$plat_id}', '{$device_id}', '{$user_id}','{$server_id}', '{$role_id}', '{$role_name}','{$role_level}','{$role_gold}','{$chat_type}','{$chat_msg}','{$chat_role}','{$role_vip}','{$chat_role_name}','{$chat_role_level}','{$dt}')";
		$this->logs($cmdsql);
		if($mysqli->query($cmdsql)){
			echo "success";
		}else{
			echo "error";
		}

    }
}
$data  = $_REQUEST['data'];
$data = str_replace(" ","+",$data);
$data = base64_decode($data);
if(strlen($data) < 20) return;
//$data  = addslashes_deep($data);
(new chatlog()) -> run($data);

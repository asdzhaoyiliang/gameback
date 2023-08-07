<?php define("SDK",TRUE);
require_once 'conf/main.php';
error_reporting(E_ERROR); 
ini_set("display_errors","Off");

$reqname = "checkLogin'";

$request = $_REQUEST;
$request['r'] =$reqname ;

switch(NETWORKTYPE){
    case 'inner':
        if ( ! $request['token']){
            if( ! $request['account'])
                exit(json_encode(array('ErrorCode'=>2, 'msg'=>"invalid parameter:account")));

            $method = lcfirst($request['r']);
            exit( (new ServerModel()) -> $method($request));
        }else{
            runController($request);
        }
        break;
    case 'outer':
        runController($request);
        break;
    default:
        exit("NETWORKTYPE error");
        break;
}

function runController($param){
    $list = ((new ServerModel())->get_all_serverlist($param));
    $serverlist  = array();
    foreach ($list as $row) {
        $server_id = intval($row['server_id']);
        $merge_id = intval($row['merge_id']);
        if($merge_id == 0){
            $merge_id = $server_id; 
        }
        $data = array(
            'id'        => $server_id,
            'name'      => $row['name'],
            'ip'        => $row['server_ip'],
            'port'      => intval($row['server_port']),
            'merge_id'  => $merge_id,
            'open_time' => strtotime($row['open_time']),
            'ahead_time' => 300,
            'flag'  => 1,
            'avatar' => 1,
            'role_name' => 'xxx',
            'role_level' => 10
            
        );
        $serverlist[]  = $data;
    }
    exit(json_encode($serverlist));
}

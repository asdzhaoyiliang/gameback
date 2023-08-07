<?php define("SDK",TRUE);
require_once 'conf/main.php';

$request = $_REQUEST;

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
    $channel= strtolower($param['channel']);
    $controller = "_" . $channel . "Login";

    if( ! $channel)    exit(json_encode(array('ErrorCode'=>2, 'msg'=>"invalid parameter:channel")));
    if ( ! class_exists($controller))    exit("{$controller} is not exists!");

    $c = new $controller();
    if ( $c instanceof Sdk) $c::pay($param);
}
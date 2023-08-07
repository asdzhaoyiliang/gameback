<?php defined('IN_WEB') || exit('Access Denied');

class TestController extends Controller{
    function __construct(){
        parent::__construct();
        $this->LogModel = new LogModel();
        $this->OrderModel = new OrderModel();
        echo "程序员使用<br/><br/>";
    }

    function index(){
        $res = Util::txtToArray("items.txt");
        $re = explode("\r\n",$res);
        foreach($re as $val){
            if( ! $val) continue;
             $foo = explode("|", $val);

            $items[$foo[0]] = $foo[1];
        }

	}


}

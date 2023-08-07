<?php
/**
 * Class GetseverControlle
 * 激活码
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */
//http://localhost/php_develop/api.php?r=cdkey/check_key&cdkey=Vrv93fgX&serverid=101&actorid=10&gamekey=2b0351468c0a25a0e17fa412ed1de293

require_once './component/Util.php';
ini_set("display_errors","Off");
error_reporting(E_ERROR);

define('LOG_PATH',str_replace('\\','/',realpath(dirname(__FILE__).'/'))); 

function SdkLog($str){
        file_put_contents(LOG_PATH. "/sdk.txt", "[". date("Y-m-d H:i:s") . "]". $str ."\r\n" ,  FILE_APPEND );
}

class NoticeController extends ApiController{

    function __construct(){
        parent::__construct();
        $this->Model = new Model();
    }

    function index(){
        exit("404 Not Found");
    }

    public function get_notice(){
        $res = $this->Model ->handle('getList',array('where'=>"notice_type = 255",'limit' => '1','order'=>'id desc'),'notice');
        if($res){
            $data = array();
            foreach($res as $val){
                $item  = array(
                    'starttime'=>$val['stime'],
                    'endtime'=>$val['etime'],
                    'content'=>$val['content']
                );
                $data[] = $item;
            }
            echo json_encode($data);
        }else
        {
            $data = array();
            echo json_encode($data);
        }
        
    }


} 

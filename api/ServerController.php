<?php
/**
 * Class ServerController
 * 获取服务器列表
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */
class ServerController extends ApiController{

    function __construct(){
        parent::__construct();
        $this->serverModel = new ServerModel();
    }

    function index(){
        exit("404 Not Found");
    }


    //获取服务器列表
    function getList(){
        $account = $this->getParam('account');
        if( !$account ){
            $msg = array('ErrorCode'=>2,'msg'=>'参数错误','data'=>array());
        }else{
            $list = array();
            //$fields = "server_id,server_ip,server_port,name,case when `status` = 5 then 2 else `status`  end  as `status`,case when `status` = 5 then 1 else 0  end  as `isNew`";
            $fields = "server_id,server_ip,server_port,name,if(`status`=5,4,`status`)  as `status`,if(`status` = 5,1,0)  as `isNew`";
            $where = 'status != 0';
            $order = 'server_id ASC' ;
            $list = $this->serverModel->handle('getList',array('fields'=>$fields,'where'=>$where ,'order'=>$order));

            //$fields = "case when s.status = 5 then 2 else s.status end as `status`,case when s.status = 5 then 1 else 0  end  as `isNew`,sl.*";
            $fields = "if(s.status=5,2,s.status) as `status`,if(s.status = 5,1,0) as `isNew`,sl.*";

            $sql = "SELECT {$fields} FROM bg_server AS s
            INNER JOIN bg_server_login AS sl
            ON sl.serverid=s.server_id
            WHERE s.status != 0 AND sl.account='{$account}'
            ORDER BY sl.logdate DESC";

            $foo = $this->serverModel->handle('find',array('sql'=>$sql));
            if($foo){
                $foo = array_slice($foo,0,4);
            }else{
                $foo = array(0);
            }
            $msg = array('ErrorCode'=>0,'msg'=>'成功','data'=>array('all'=>$list,'my'=>$foo));
        }
        //print_r($msg);
        echo json_encode($msg,JSON_UNESCAPED_UNICODE);
        return;
    }

    //保存账号登录过的服务器
    function save(){
        $account = $this->getParam('account');
        $serverid = $this->getParam('serverid');

        if( !$account || !$serverid ){
            $msg = array('ErrorCode'=>2,'msg'=>'参数错误','data'=>array());
        }else{
            $data = array(
                'account'=>$account,
                'serverid'=>intval($serverid),
                'logdate'=>time()
            );
            $res = $this->serverModel->handle('replace',array('data'=>$data),'server_login');
            if( $res ){
                $msg = array('ErrorCode'=>0,'msg'=>'成功','data'=>array());
            }else{
                $msg = array('ErrorCode'=>3,'msg'=>'数据插入失败','data'=>array());
            }
        }
        echo json_encode($msg,JSON_UNESCAPED_UNICODE);
        return;
    }

}


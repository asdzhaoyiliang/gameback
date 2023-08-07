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

define('LOG_PATH',str_replace('\\','/',realpath(dirname(__FILE__).'/'))); 

function SdkLog($str){
        file_put_contents(LOG_PATH. "/sdk.txt", "[". date("Y-m-d H:i:s") . "]". $str ."\r\n" ,  FILE_APPEND );
}



class CdkeyController extends ApiController{

    function __construct(){
        parent::__construct();
        $this->cdkeyModel = new CdkeyModel();
    }

    function index(){
        exit("404 Not Found");
    }

    /**
     * 客户端通过api验证激活码
     */
    public function check_key(){
        //api.php?r=cdkey/check_key&cdkey=111&server=999&role=999
        $cdkey =   $this->getParam('card');
        $serverid= $this->getParam('server');
        $actorid = $this->getParam('role');

        $server= (new ServerModel())->handle('getOne',array("where"=>"server_id={$serverid}"), 'server');
        if(!$server){
            $msg = array('ErrorCode'=>2,'msg'=>'invalid params','data'=>array());
            exit(json_encode($msg));
        }
        $merge_id = $server['merge_id'];
        if($merge_id != 0){
            $serverid = $merge_id;
        }
        if(!$cdkey || !$serverid || !$actorid){
            $msg = array('ErrorCode'=>2,'msg'=>'invalid params','data'=>array());

        }else{
            //获取互斥组
            $mutex = array();
            $res = $this->cdkeyModel ->handle('getList',array('where'=>"actorid={$actorid}"),'cdkey_use');
            if($res){
                foreach($res as $val){
                    $val['mutex'] && $mutex[] = $val['mutex'];
                }
            }

            //获取激活码所有信息
            $sql = "SELECT ck.*,b.* FROM bg_cdkey AS ck LEFT JOIN bg_batch AS b ON ck.batch_id=b.id";
            $sql .= " WHERE ck.cdkey='{$cdkey}'";
            $res = $this->cdkeyModel ->handle('find',array('sql'=>$sql));
            $res && $res = $res[0];

            //同批号使用次数
            $condition = array(
                'where' => "actorid={$actorid} AND batch_id={$res['id']}",
                'fields' => "count(*) AS total",
            );
            $pi_usetime = $this->cdkeyModel ->handle('getOne',$condition,'cdkey_use');
            $pi_usetime = $pi_usetime ? $pi_usetime['total'] : 0;

            //
            if(!$res){
                //激活码无效
                $msg = array('ret'=>7,'msg'=>'invalid cdkey','data'=>array());

            }elseif(  999999999 != $res['serverid'] && !in_array($serverid,explode(',',$res['serverid'])) ) {
                //服务器无效
                $msg = array('ret'=>7,'msg'=>'invalid server','data'=>array());

            }elseif($res['use_times'] >= $res['limit_times']){
                //超过使用次数
                $msg = array('ret'=>6,'msg'=>'Times is not enough','data'=>array());

            }elseif($res['etime'] && time()>strtotime($res['etime'])){
                //已过有效期
                $msg = array('ret'=>1,'msg'=>'Has passed the period of validity','data'=>array());

            }elseif($res['stime'] && time()<strtotime($res['stime'])){
                //未到激活码使用时间
                $msg = array('ret'=>1,'msg'=>'Before the opening time','data'=>array());

            }elseif(  in_array($res['mutex'],$mutex) ){
                //不能使用互斥组中的其他批号激活码
                $msg = array('ret'=>1,'msg'=>'can not use mutex cdkey','data'=>array());

            }elseif($res['limit_pi'] <= $pi_usetime){
                //超过同批号使用次限
                $msg = array('ret'=>6,'msg'=>'exceed times of batch','data'=>array());

            } else{
                $data = array(
                    'cdkey'=>$res['cdkey'],
                    'item_id'=>$res['item_id']
                );
                $msg = array('ret'=>0,'msg'=>'success','data'=>$data);
                //GAMECMD
                $title =   $res['name'];
                $content = "恭喜您获得".$res['name'].",祝您游戏快乐!";
                $cmdstr = "1"."|".$actorid."|".$title."|".$content."|";
                $itemstr = $res['item_id'];
                $cmdstr .= $itemstr;
                $cmdid = 10084;
                $date = date("Y-m-d H:i:s");
                $GAMECMD = Util::getMysqlCon(GAMECMDHOST,GAMECMDUSER,GAMECMDPASS,GAMECMDDBNAME,GAMECMDPORT);
                $sql = "INSERT INTO `command` (serverindex, operindex, strcom, nstate,username,logdate,reser1) VALUES ('{$serverid}','{$cmdid}','{$cmdstr}','1','0','{$date}',1)";
                SdkLog($sql);
                if(!$GAMECMD->query($sql)){ 
                    $msg = array('ret'=>7,'msg'=>'invalid server','data'=>array());
                }else{
                    $this->on_key_success($cdkey,$serverid,$actorid);
                }
            }
        }
        echo json_encode($msg);
        return;
    }

    public function on_key_success($cdkey,$serverid,$actorid){
        if(!$cdkey || !$serverid || !$actorid){
            return;
        }else{
            $sql = "SELECT ck.*,b.* FROM bg_cdkey AS ck LEFT JOIN bg_batch AS b ON ck.batch_id=b.id";
            $sql .= " WHERE ck.cdkey='{$cdkey}'";
            $res = $this->cdkeyModel ->handle('find',array('sql'=>$sql));
            $res = $res[0];

            if($res['use_times'] != $res['limit_times']){
                $data = array(
                    'actorid'=>intval($actorid),
                    'cdkey'=>$cdkey,
                    'logdate'=>date("Y-m-d H:i:s",time()),
                    'batch_id'=>intval($res['id']),
                    'serverid'=>$serverid
                );
                $res['mutex'] && $data['mutex'] = $res['mutex'];
                $this->cdkeyModel->handle('insert',array('data'=>$data),'cdkey_use');

                $sql = "UPDATE bg_cdkey SET use_times=use_times+1 WHERE `cdkey`='{$cdkey}'";
                $this->cdkeyModel ->handle('query',array('sql'=>$sql));
            };
        }
    }
   
    /**
     * 激活码在客户端成功使用后请求api更改激活码使用次数
     */
    public function key_success(){
        $cdkey = $this->getParam('cdkey');
        $serverid= $this->getParam('serverid');
        $actorid = $this->getParam('actorid');

        if(!$cdkey || !$serverid || !$actorid){

            $msg = array('ErrorCode'=>2,'msg'=>'参数错误');

        }else{
            $sql = "SELECT ck.*,b.* FROM bg_cdkey AS ck LEFT JOIN bg_batch AS b ON ck.batch_id=b.id";
            $sql .= " WHERE ck.cdkey='{$cdkey}'";
            $res = $this->cdkeyModel ->handle('find',array('sql'=>$sql));
            $res = $res[0];

            if($res['use_times'] != $res['limit_times']){
                $data = array(
                    'actorid'=>intval($actorid),
                    'cdkey'=>$cdkey,
                    'logdate'=>date("Y-m-d H:i:s",time()),
                    'batch_id'=>intval($res['id']),
                    'serverid'=>$serverid
                );
                $res['mutex'] && $data['mutex'] = $res['mutex'];
                $this->cdkeyModel->handle('insert',array('data'=>$data),'cdkey_use');

                $sql = "UPDATE bg_cdkey SET use_times=use_times+1 WHERE `cdkey`='{$cdkey}'";
                $this->cdkeyModel ->handle('query',array('sql'=>$sql));
            };

            $msg = array('ErrorCode'=>0,'msg'=>'success');
        }
        echo json_encode($msg);
        return;
    }
} 
<?php
/**
 * Class callback
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

abstract class callback{

    function __construct(){
        header("Content-type: text/html; charset=utf-8");
        $this->orderModel = new OrderModel();
    }

    //--------------------------------------------

    /**
     * 记录失败订单
     * @param $data
     * @param $msg
     */
    function orderFail($data, $msg){
        $data['errorMsg'] = $msg;
        $this->orderModel -> handle('insert', array('data'=>$data),'order_fail');
    }

    //--------------------------------------------

    /**
     * 验证IP是否合法
     * @param $ip
     * @param $channel
     *
     * @return bool
     */
    function check_ip($ip, $channel, $data){
         if( ! whiteIP::$channel($ip) ){
             $this->orderFail($data,"invalid IP:$ip");
             exit(json_encode(array('ErrorCode'=>11,'msg'=>'invalid IP')));
         }
        return true;
     }

    //--------------------------------------------

    /**
     *  验证签名是否正确
     * @param $sign
     * @param $check_sign
     * @param $data
     */
    function check_sign($sign, $check_sign, $data){
        if( $sign !== $check_sign){
            $this->orderFail($data,"invalid sign");
            exit(json_encode(array('ErrorCode'=>12,'msg'=>'error parameter:sign')));
        }
        return true;
    }

    //--------------------------------------------
    /**
     * 验证服务器id合法性
     * @param $data
     * @param $serverid
     *
     * @return mixed
     */
    function check_serverid($data, $serverid){
        $condition = array(
            "where" => "server_id=$serverid",
            'fields'=>"mysql_host,mysql_user,mysql_passwd,actor_table,mysql_port",
        );
        $ser = (new ServerModel())->handle('getOne',$condition, 'server');

        if( ! $ser ){
            $this->orderFail($data,"invalid serverid:$serverid");
            exit(json_encode(array('ErrorCode'=>13,'msg'=>'error parameter:serverid')));
        }

        return $ser;
    }

    //--------------------------------------------

    /**
     * 检测订单是否已经存在
     * @param $where
     * @param $data
     */
    function check_order_if_exists($where, $data){
        $res = $this->orderModel-> handle('getOne', array('where'=>$where),'order');
        if($res) {
            $this->orderFail($data,"order has exists");
            exit(json_encode(array('ErrorCode'=>14,'msg'=>'order is used' )));
        }
        return true;
    }

    //--------------------------------------------

    /**
     * 下发元宝
     *
     * @param $data
     * @param $ser
     *
     * @return mixed
     */
    function email_to_seed_gold($data, $ser){
        //连接数据库
        $mysql = Util::getMysqlCon($ser['mysql_host'],$ser['mysql_user'],$ser['mysql_passwd'],$ser['actor_table'],$ser['mysql_port']);

        //根据账号获取角色id和等级
        $sql = "SELECT actorid,`level` FROM actors WHERE accountname='" . $data['account'] . "' AND serverindex=" . $data['serverid'];
        $query = $mysql->query($sql);
        while($row = $query->fetch_assoc()){
            $actorid = $row['actorid'];
            $level = $row['level'];
        }

        if(!$actorid){
            $this->orderFail($data,'invalid actor');
            exit(json_encode(array('ErrorCode'=>15,'msg'=>'invalid actor ')));
        }

        //组织邮件数据
        $yuanbao = intval($data['money']*50);
        $mail_data = array(
            'mailid' => $this -> getMailID(60000+rand(1,1000), $data['serverid']),
            'actorid'  => $actorid,
            'type'  => 2,
            'context'  => "恭喜您充值成功!这次您充值{$data['money']}RMB,可获得{$yuanbao}元宝。元宝已经发放，请查收。谢谢您对游戏的支持！祝你玩的愉快！",
            'status'=>0,
            'sendname'=> '系统邮件-充值成功',
            'sender_id'=> 0,
            'maildate' => date('Y-m-d H:m:s'),
            'sendtick'=> $this -> getMiniTime(),

            'file0_type' => 2,
            'file0_sort' => 3,
            'file0_num' => $data['money']*50,
             'file0_bind' =>-1,
        );

        foreach ($mail_data as $k => $v) {
            $fields[] = "`$k`";
            $value[] = is_int($v) ? $v : "'$v'";
        }
        $insert_fields = implode(',', $fields);
        $insert_value = implode(',', $value);

        //发送邮件
        $sql = "INSERT INTO `actormail` ({$insert_fields}) VALUES ({$insert_value})";
        if(!$mysql->query($sql)){
             exit(json_encode(array('ErrorCode'=>16,'msg'=>$sql)));
        }

        $gm_data = "({$data['serverid']}, 0, 'gm', 'getmail', {$actorid})";
        $sql = "INSERT INTO `gmcmd` (serverid,cmdid,cmd,param1,param2) VALUES {$gm_data}";
        if(!$mysql->query($sql)){
             exit(json_encode(array('ErrorCode'=>17,'msg'=>$sql)));
        }

        return array('level' => $level, 'actorid' => $actorid);
    }

    //--------------------------------------------

    /**
     * 订单入库
     * @param $data
     */
    function addOrder($data){
        if( ! $this->orderModel->handle('insert', array('data'=>$data),'order') ){
            $this->orderFail($data,"fail to insert order");
            exit(json_encode(array('ErrorCode'=>18,'msg'=>'fail to insert order')));
        }
        return true;
    }

    //--------------------------------------------

     //邮件id随机产生
    function getMailID($sec=60000, $serverid=0){
         $sid = $serverid;
         if($serverid > 0){
             $sid = $serverid;
         }else{
             if(isset($_SESSION['server_id'])){
                 $sid = intval($_SESSION['server_id']);
             }
         }
         $low = decbin(time());
         $middle = $this -> zerofill(decbin($sec), 16);
         $high = $this -> zerofill(decbin($sid), 16);
         $mailid = bindec($high . $middle . 0 . $low);
         return sprintf("%1.0f",$mailid);
    }
    function zeroFill($str, $len){
         $tmp = '';
         for ($i=0; $i<($len-strlen($str)); $i++){
             $tmp .= "0";
         }
         $newStr = $tmp . $str;
         return $newStr;
    }

    //--------------------------------------------

     //获取距离 2010-01-01 00:00:00 的秒数
    function getMiniTime($n=''){
         $n || $n=time();
         $t = strtotime('2010-01-01 00:00:00');
         $minitime = $n - $t;
         return $minitime;
    }
} 
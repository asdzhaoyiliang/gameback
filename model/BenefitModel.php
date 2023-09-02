<?php
/**
 * Class BenefitModel
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */


class BenefitModel extends Model{

    static $zxBenefitState = array(
            0=>11,
            1=>4,
            2=>3,
            3=>1,
            4=>1,
            5=>5,
            6=>11,
        );

    //福利列表
    public function getData($conditon) {
        $res = $this->handle('getList', $conditon, 'benefit');

        if($res){
            foreach($res as $row){
                $option = <<< END
            <a href="javascript:void(0)" onclick="benefit_edit({$row['benefit_id']})">编辑</a>     |
            <a href="javascript:void(0)" onclick="benefit_delete({$row['benefit_id']})">删除</a>
END;
                if ($row['cycle'] == 1){
                    $cycle = "每日";
                }elseif($row['cycle'] == 2){
                    $cycle = "每周";
                }elseif ($row['cycle'] == 3){
                    $cycle = "每月";
                }
                $aaData[] = [
                    $row['benefit_id'],
                    $row['name'],
                    $row['reason'],
                    $row['first_mail'],
                    $row['common_mail'],
                    $cycle,
                    $row['day'],
                    $row['send_time'],
                    $option,
                ];
            }
        }
        return $this->returnJsonData($conditon, $aaData?$aaData:array());
    }


    public function getOneById($benefitId,$fields="*"){
        $condition = array(
            'fields' => $fields,
            "where"  => "benefit_id={$benefitId}",
        );
        return $this->handle('getOne', $condition, 'benefit');
    }



       //----------------------------------------------------------sdk
  

   //----------------------------------------------------------sdk
   //客户端请求获取服务器列表
   public function checkLogin($actor_info=array(0)){

        // 增加密码认证
        $account = trim($actor_info['account']);
        $passwd = trim($actor_info['passwd']);     
        $info = $this->getAccount($account);
        if(!$info)
            return json_encode(array('ErrorCode'=>1, 'msg'=>"该帐号不存在"),JSON_UNESCAPED_UNICODE);
        if($info['password'] != $passwd )
            return json_encode(array('ErrorCode'=>2, 'msg'=>"用户密码错误"),JSON_UNESCAPED_UNICODE);

        $msg = array(
            'ErrorCode'=>0,
            'msg'=>'success',
            'data'=>array(
                'all'=>$this -> benefit_list_for_client($actor_info),
                'my' =>$this -> four_recently_login_benefit($actor_info)
            ),
            'actor_info'=>$actor_info
        );
        return json_encode($msg,JSON_UNESCAPED_UNICODE);
    }

    //获取全服列表给客户端
   public function get_all_benefitlist($param){
        $channel = $param['channel'];
        $t = time();
        //$where = "channel = '{$channel}' and UNIX_TIMESTAMP(open_time) <= '{$t}'";
        $where = "UNIX_TIMESTAMP(open_time) <= '{$t}'";
        $condition = array(
            'where'=> $where,
            'fields'=>"benefit_id,benefit_ip,benefit_port,name,open_time,merge_id",
            'order' => 'benefit_id ASC'
        );
        $list = $this->handle('getList', $condition, 'benefit');
        //var_dump($list);
        return $list;
   }


    //获取全服列表给客户端
   public function benefit_list_for_client($param){
        if ($_SESSION['benefit_list_for_client'])
            return $_SESSION['benefit_list_for_client'];

        $where = "status != 0 ";

        if(NETWORKTYPE != "inner"){
           $channel = $param['channel'];

            $tmp  = whiteIP::_channelIp($_SERVER["REMOTE_ADDR"]);
            if( $tmp ){
                $foo = explode(",", $tmp);
                $foo[] = $channel;
                foreach($foo as $val){
                    $arr[] = "'" . $val . "'";
                }
                $where .=  " AND channel IN (" .implode(",", $arr). ")";
            }else{
                $where .= " AND channel='{$channel}'";
            }
        }

        $condition = array(
            'where'=> $where,
            'fields'=>"benefit_id,benefit_ip,benefit_port,name,if(`status`=5,4,`status`)  as `status`,if(`status` = 5,1,0)  as `isNew`",
            'order' => 'benefit_id ASC'
        );
        $list = $this->handle('getList', $condition, 'benefit');
        $_SESSION['benefit_list_for_client'] = $list;

        return $list;
   }

    //获取用户最近登录过的4个服务器
   public function four_recently_login_benefit($param){
        $account = $param['account'];
        $tmp = "four_recently_login_benefit_of_" . $account;

        if ($_SESSION[$tmp]) return $_SESSION[$tmp];


        $fields = "if(s.status=5,2,s.status) as `status`,if(s.status = 5,1,0) as `isNew`,sl.*";
        $where = "s.status != 0 AND sl.account='{$account}'";

        if(NETWORKTYPE != "inner"){
            $channel = $param['channel'];
            $where .= " AND s.channel='{$channel}'";
        }

        $sql = "SELECT {$fields} FROM bg_benefit AS s
                INNER JOIN bg_benefit_login AS sl
                ON sl.benefitid=s.benefit_id
                WHERE {$where}  ORDER BY sl.logdate DESC";
        $foo = $this->handle('find', array('sql'=>$sql));
        if ($foo) {
            $foo = array_slice($foo,0,4);
            $_SESSION[$tmp] = $foo;
        }else{
            $foo = array(0);
        }

        return $foo;
   }

   public function getAccount($account){
         $condition = array(
            'fields' => "*",
            "where"  => "account='{$account}'"
        );
        return $this->handle('getOne', $condition, 'account');
   }

   public function register($param){
        $account = trim($param['account']);
        $passwd = $param['passwd'];
       
        if($this->getAccount($account)){
            return json_encode(array('ErrorCode'=>1, 'msg'=>"帐号已存在."),JSON_UNESCAPED_UNICODE);
        }
        $data = array(
            'account' => $account,
            'password' => $passwd,
            'channel' => trim($param['channel']),
            'createtime' =>date("Y-m-d H:i:s",time())
            );
        if(!$this->handle('insert', array('data'=>$data),'account') ){
            return json_encode(array('ErrorCode'=>2, 'msg'=>"注册失败."),JSON_UNESCAPED_UNICODE);
        }
        return json_encode(array('ErrorCode'=>0, 'msg'=>"success"),JSON_UNESCAPED_UNICODE);
   }
    //保存用户登录的服务器
   public function saveLogin($param){

        //处理参数
        $benefitid = $_REQUEST['benefitid'];
        $account  = $param['account'];
        $datetime = date('Y-m-d H:i:s',time());
        $passwd = md5( $account. $benefitid . time() . rand(100,999));
        $ip = get_client_ip();
		$payflag = 1;
		$package = $_REQUEST['packname'];
		$packcond = array(
		  "where"=> "flag='{$package}'",
		  "fields" => "flag,name"
		);
		$packdb = $this->handle('getOne',$packcond,'package');
		if($packdb){
			$payflag = $packdb['name'];
		}
		
        if( !$account || !$benefitid) exit(json_encode(array('ErrorCode'=>2,'msg'=>'invalid parameter')));

        //根据服务器id获取服务器信息
        $condition = array(
            "where"  => "benefit_id={$benefitid}",
            "fields" => "mysql_host,mysql_user,mysql_passwd,actor_table,mysql_port"
        );
        $db = $this->handle('getOne',$condition,'benefit');
        if( ! $db ) exit(json_encode(array('ErrorCode'=>4, 'msg'=>"invalid benefitid")));

        //更改用户密码
        $mysql = Util::getMysqlCon($db['mysql_host'],$db['mysql_user'],$db['mysql_passwd'],$db['actor_table'],$db['mysql_port']);
        $sql = " UPDATE globaluser SET passwd = '{$passwd}',updatetime = '{$datetime}' , ipstr='{$ip}' WHERE account = '{$account}'";
        $mysql->query($sql);

        if ( 0 === $mysql->affected_rows) {
            //用户不存在 创建用户
            $sql = "INSERT INTO globaluser(account,passwd,createtime,ipstr) VALUES ('{$account}','{$passwd}','{$datetime}','{$ip}')";
            $mysql->query($sql);
            if ( 0 === $mysql->affected_rows) exit(json_encode(array('ErrorCode'=>5, 'msg'=>"sql error")));
        };

        //记录用户登录的服务器
        $insert = array('account' => $account, 'logdate' => time(), 'benefitid' =>$benefitid);
        $this -> handle('replace', array('data'=>$insert), 'benefit_login');

        //保存用户最近登录过的4个服务器到session
        $this -> four_recently_login_benefit(array('account' => $account));

        //返回数据给客户端
        $msg = array('ErrorCode'=>0, 'msg'=>"success", 'data'=>array('account'=>$account, 'passwd'=>$passwd,'payflag'=>$payflag));
        return json_encode($msg,JSON_UNESCAPED_UNICODE);
    }
    //----------------------------------------------------------sdk
}
/* End of file BenefitModel.php */
/* Location: ./model/BenefitModel.php */
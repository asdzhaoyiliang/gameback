<?php
/**
 * Class OrdercronController
 *订单统计：包括每日充值、充值排序、充值等级、
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class OrdercronController extends CronController{

    public $OrderModel;

    public function  __construct() {
        parent::__construct();
        $this->OrderModel = new OrderModel();
    }

    public function run(array $argv = null){
        $stime = $argv['stime'] ? $argv['stime'] : $this->stime;
        $this->statOrder($stime);
        $this->statOrderRank();
        $this->statOrderLevel($stime);
    }

    //充值统计：充值人数、充值次数、充值金额、首冲人数、首冲次数、首冲金额
    public function statOrder($stime){
        $etime = $stime + 86400;
        $condition = array(
            'fields'=> "account, serverid, money",
            'where' => " unix_timestamp(create_time) >={$stime} AND unix_timestamp(create_time) < {$etime}",
            'order' => "create_time DESC"
        );
        $res = $this->OrderModel->handle('getList', $condition, 'order');
        if( ! $res ) return;

        $data = $account = array();
        foreach($res as $val){
            $data[$val['serverid']]['times'] ++ ;  //统计日充值次数
            $data[$val['serverid']]['money'] +=$val['money'] ;  //统计日充值金额
            $data[$val['serverid']][$val['account']] =  $val['money'];//用来计算首冲金额
            $account[$val['serverid']][$val['account']] =  $val['account']; //用来统计充值人数和新玩家付费数
        }
        //print_r($data);return;

        foreach($data as $serverid => $val){
				$server_info = (new ServerModel())->handle('getOne',array("where"=>"server_id={$serverid}"), 'server');
				if(!$server_info) continue;
				//-----新玩家付费数 begin
                /**  获取新注册玩家账号 **/
                $con = array(
                    'fields'=>"actorid",
                    'where' => " unix_timestamp(createtime) >={$stime} AND unix_timestamp(createtime) < {$etime}",
                );
				$GAMESQL = Util::getMysqlCon($server_info['mysql_host'],$server_info['mysql_user'],$server_info['mysql_passwd'],$server_info['actor_table'],$server_info['mysql_port']);
				$sql = "select actorid from `actors` where unix_timestamp(createtime) >={$stime} AND unix_timestamp(createtime) < {$etime}";
				$query = $GAMESQL->query($sql);
				while($row = $query->fetch_assoc()){
					$actors_accountname[] = $row['actorid'];
				}
                //$accountname = array_column($actors_accountname, 'actorid');
				
                /**  计算统计日付费玩家和新玩家账号的交集，得到新付费玩家 **/
                $new_role_charge = array_intersect($account[$serverid] , $accountname);

                 /** 通过新付费玩家账号统计新付费玩家充值金额  **/
                if ($new_role_charge) {
                    foreach($new_role_charge as $v){
                        $tmp_new_role[] = "'$v'";
                    }
                    $tmp_new_role = implode(",", $tmp_new_role);

                    $condition = array(
                        'fields'=>"SUM(money) AS money",
                        'where' => " unix_timestamp(create_time) >={$stime} AND unix_timestamp(create_time) < {$etime} AND account IN ($tmp_new_role)",
                    );
                    $res = $this->OrderModel->handle('getOne', $condition, 'order');
                    $new_role_charge_money = (int)$res['money'];
                }else{
                    $new_role_charge_money = 0;
                }
             //-----新玩家付费数 end


            //-----------首冲  begin
            $foo = $tmp = array();
            foreach($account[$serverid] as $acc){
                if( in_array($acc, $foo) ){
                    continue;
                }else{
                    $foo[] = $acc;
                }

                //检测该用户是否已经充值过
                $condition = array(
                    'where' => " `time` < {$stime} AND account='{$acc}'",
                    'fields' =>"id"
                );
                $result = $this->OrderModel->handle('getOne', $condition, 'order');

                //没有充值记录，为首冲
                if(!$result){
                    $tmp['f_num'] ++;//首冲人次
                    $tmp['f_money'] += $val[$acc];//首冲金额
                }
            }
            //-----------首冲  end


            //数据入库
            $inert = array(
                'logdate'   => date("Y-m-d", $stime),
                'serverid'  => $serverid,
                'num'       => count($account[$serverid]),
                'times'     => $val['times'],
                'money'     => $val['money'],

                'f_times'   => $tmp ? $tmp['f_num'] : 0,
                'f_num'     => $tmp ? $tmp['f_num'] : 0,
                'f_money'   => $tmp ? $tmp['f_money'] : 0,

                'new_role_charge_num' => count($new_role_charge),
                'new_role_charge_money' => $new_role_charge_money
            );
            $this->OrderModel->handle('replace', array('data'=>$inert), 'order_stat');
        }
    }

    //充值排行榜
    public function statOrderRank(){
        //分服统计
        $this -> rank(false);
        //全服统计
        //$this -> rank(true);
    }
    private function rank( $isAll = false){
        $condition = array(
            'fields' => "sum(money) AS money, serverid, account",
            'order'  => "money DESC",
            'limit'  => "0,100"
        );
        $condition['group'] = $isAll ? 'account' : 'serverid, account';
        $res = $this->OrderModel->handle('getList',  $condition, 'order');
        if( !$res ) return;

        foreach($res as $key=>$val){
            $condition = array(
                'fields' => "COUNT(*) AS times, max(create_time) AS last",
                'where'  => " account = '" . $val['account'] . "'"
            );
            $foo = $this->OrderModel->handle('getOne', $condition, 'order');

            //组织数据
            $data=array(
                'rank'=>$key+1,
                'account'=>$val['account'],
                'money'=>$val['money'],
                'times'=>$foo['times'],
                'last_charge_time'=>$foo['last'],
            );

            $data['serverid'] = $isAll ? 999999999 : $val['serverid'];

            $this->OrderModel->handle('replace', array('data'=>$data), 'order_rank');
        }

    }

    //统计每个等级的充值次数和充值金额
    public function statOrderLevel($stime){
        //分服统计
        $condition = array(
            'fields' => "COUNT(*) AS times,  SUM(money) AS money,  serverid, level",
            'group' =>"serverid, level",
            'order' => "level ASC"
        );
        $res =$this->OrderModel->handle('getList', $condition, 'order');
        if( ! $res ) return;

        foreach($res as $val){
            $foo[$val['serverid']][] = array(
                'level'  => (int)$val['level'],
                'times'  => (int)$val['times'],
                'money'  => (int)$val['money'],
            );
        }
        foreach($foo as $key=>$val){
            $data = array(
                'logdate' => date("Y-m-d",$stime),
                'serverid' => $key,
                'content'  => json_encode($val)
            );
            $this->OrderModel->handle('replace', array('data'=>$data), 'order_level');
        }
    }

}


/* End of file OrdercronController.class.php */
/* Location: ./controller/cron/OrdercronController.class.php  */

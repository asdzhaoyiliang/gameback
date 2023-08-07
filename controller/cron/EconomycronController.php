<?php
/**
 * Class EconomycronController
 * 经济统计，即元宝铜钱银两的产生与消耗统计
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class EconomycronController extends CronController{

    public function __construct(){
        parent::__construct();
        $this->model = new Model();
    }

    public function run(array $argv = null){
        $stime = $argv['stime'] ? $argv['stime'] : $this->stime;

        //分服统计开始
        foreach($this->server_list as $row){
            $mysqlDB_log = new mysqli($row['mysql_host'],$row['mysql_user'], $row['mysql_passwd'],$row['log_table'],$row['mysql_port']);
            if($mysqlDB_log->errno){
                continue;
            }
            $argv=array(
                'mysqlDB_log'   => $mysqlDB_log,
                'serverid'      => $row['server_id'],
                'stime'         => $stime,
                'Ymd'           => date('Ymd', $stime),
            );
            $this->procedure_single($argv);
        }

        //全服统计开始：依赖分服统计，必须在分服统计之后
        //$this->procedure_all($stime);
    }

    //单服统计
    function procedure_single($argv){
        $tableName = "log_consume_{$argv['Ymd']}";
        $field = "SUM(-paymentcount) AS amount , moneytype, logid";
        $group = "moneytype, logid";

        //按角色统计
        $sql = "SELECT {$field}, userid FROM {$tableName} GROUP BY userid,{$group}";
        $query = $argv['mysqlDB_log']->query($sql);
        while($res = $query->fetch_assoc()){
            $foo[$res['actorid']][]=array(
                'currency' => $res['currency'],//货币类型
                'kingdom'  => $res['kingdom'],//消费类型
                'amount'   => $res['amount'],//数量
            );
        }
        if($foo){
            foreach($foo as $key=>$val){
                $data=array(
                    'logdate' => date("Y-m-d",$argv['stime']),
                    'actorid' => $key,
                    'serverid'=> $argv['serverid'],
                    'content' => json_encode($val)
                );
                $this->model->handle('replace', array('data'=>$data) ,'economy');
            }
        }

        //按服务器统计
        $sql="SELECT {$field},COUNT(DISTINCT userid) AS num FROM {$tableName} GROUP BY {$group}";
        $query = $argv['mysqlDB_log']->query($sql);
        while($res = $query->fetch_assoc()){
            $data=array(
                'logdate'  => date("Y-m-d",$argv['stime']),
                'serverid' => $argv['serverid'],
                'amount'   => $res['amount'],
                'num'      => $res['num'],
                'currency' => $res['currency'],
                'kingdom'  =>  $res['kingdom'],
            );
            $this->model->handle('replace', array('data'=>$data), 'economy_all');
        }
        $argv['mysqlDB_log']->close();

    }

    //全服统计
    function procedure_all($stime){
        $condition = array(
            'where'  => "unix_timestamp(logdate)={$stime} ",
            'fields' => "SUM(-paymentcount) AS amount, COUNT(DISTINCT userid) AS num, moneytype, logid",
            'group'  => "moneytype, logid"
        );
        $res =  $this->model->handle('getList', $condition, 'economy_all');

        if($res){
           $foo = array('logdate'=> date("Y-m-d",$stime), 'serverid' => 999999999);
            foreach($res as $val){
                $data = array_merge($foo, $val);
                $this->model->handle('replace', array('data'=>$data), 'economy_all');
            }
        }
    }

}
/* End of file EconomycronController.class.php */
/* Location: ./controller/cron/EconomycronController.class.php  */
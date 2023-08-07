<?php
/**
 * Class Online1cronController
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */
/**
 * 计划任务：
 * 在线时长
 * 主要统计每人在线人数的最大值、最小值、平均值。统计后的数据保存在中央服的bg_online表
 * 综合在线用到这些数据
 *
 */

class OnlinecronController extends CronController{

    public function __construct(){
        parent::__construct();
        $this->model = new Model();
    }

    public function run(array $argv = null){
        $stime = $argv['stime'] ? $argv['stime'] : $this->stime;

        //分服统计开始
        foreach($this->server_list as $row){
            $mysqlDB_log = new mysqli($row['mysql_host'],$row['mysql_user'], $row['mysql_passwd'],$row['log_table'],$row['mysql_port']);
            if($mysqlDB_log->errnoo ) continue;
            $argv=array(
                'mysqlDB_log'   => $mysqlDB_log,
                'serverid'      => $row['server_id'],
                'stime'         => $stime,
                'etime'         => $stime+86400,
                'Ymd'            => date('Ymd',$stime),
            );
            $this->procedure_single($argv);
        }

        //全服统计：依赖分服统计，必须在分服统计之后
        //$this->procedure_all($stime);
    }

    //单服统计
    public function procedure_single($argv){
        $sql = "SELECT `onlinecount`,logdate FROM log_onlinecount_{$argv['Ymd']}
                WHERE unix_timestamp(logdate)>={$argv['stime']} AND unix_timestamp(logdate)<{$argv['etime']}
                AND serverindex ={$argv['serverid']}";
        echo $sql;
        $query = $argv['mysqlDB_log']->query($sql);
        $min = $hour = array();
        while($data = $query->fetch_assoc()){
            $t = strtotime($data['logdate']);

            $min[date("H:i",$t)] += $data['count'];

            if( date('i', $t) == '0'){
                $hour[date("H:00", $t)] = $data['count'];
            }
        }
        $argv['mysqlDB_log']->close();
        if( !$min && !$hour) return;

        $content = array('min'=>$min, 'hour'=>$hour);
        $data = array(
            'logdate'  => date("Y-m-d", $argv['stime']),
            'serverid' => $argv['serverid'],
            'max'      => max($hour),
            'min'      => min($hour),
            'avg'      => $hour ? round(array_sum($hour)/count($hour), 2) : 0,
            'content'  => json_encode($content)
        );
        $this->model->handle('replace',array('data'=>$data),'online');
    }

    //全服统计
    public  function procedure_all($stime){
        return;
        $OnlineModel = new OnlineModel();
        $etime = $stime+86400;
        $where = "unix_timestamp(logdate)>={$stime} AND unix_timestamp(logdate)<{$etime} AND serverid != 999999999";

        //1分钟在线全服统计
        $sql = "SELECT SUM(count) AS `count`,logdate FROM bg_online_1min WHERE {$where} GROUP BY logdate";
        $res = $OnlineModel->handle('find',array('sql'=>$sql),'online_1min');
        if($res){
            foreach($res as $val){
                $val['serverid'] = 999999999;
                $OnlineModel->handle('replace', array('data'=>$val), 'online_1min');
            }
        }
        //每小时在线全服统计
        $sql = "SELECT SUM(count) AS `count`,logdate FROM bg_online_hour WHERE {$where} GROUP BY logdate";
        $res = $OnlineModel->handle('find', array('sql'=>$sql), 'online_hour');
        if($res){
            foreach($res as $val){
                $val['serverid'] = 999999999;
                $OnlineModel->handle('replace', array('data'=>$val), 'online_hour');
            }
        }

        //最大值最小值平均值-按小时算
        $where = "unix_timestamp(logdate)>={$stime} AND unix_timestamp(logdate)<{$etime}";
        $sql="SELECT max(count) AS `max`,min(count) AS `min`,avg(count) AS `avg`,serverid FROM bg_online_hour WHERE {$where} GROUP BY serverid";
        $res = $OnlineModel->handle('find', array('sql'=>$sql), 'online_hour');
        if($res){
            foreach($res as $val){
                $val['avg'] = round($val['avg'],2);
                $val['logdate'] = date("Y-m-d",$stime);
                $OnlineModel->handle('replace', array('data'=>$val), 'online');
            }
        }
    }

}
/* End of file OnlinecronController.class.php */
/* Location: ./controller/cron/OnlinecronController.class.php  */
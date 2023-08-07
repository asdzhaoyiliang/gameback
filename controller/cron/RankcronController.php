<?php
/**
 * Class RankcronController
 * 计划任务：元宝消费排行榜、商城购买排行榜、物品消耗排行榜
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class RankcronController extends CronController{

    public function run(array $argv = null){
        $stime = $argv['stime'] ? $argv['stime'] : $this->stime;

        //分服统计开始
        foreach($this->server_list as $row){
            $mysqlDB_log = new mysqli($row['mysql_host'],$row['mysql_user'], $row['mysql_passwd'],$row['log_table'],$row['mysql_port']);
            if($mysqlDB_log->errno){
                continue;
            }
            $argv=array(
                'mysqlDB_log'  => $mysqlDB_log,
                'serverid'     => $row['server_id'],
                'stime'        => $stime,
                'etime'        => $stime+86400,
                'Ymd'          => date('Ymd',$stime),
                'Ym'           => date('Ym',$stime),
            );
            $this->procedure_single($argv,'phylum',1);//元宝统计
            $this->procedure_single($argv,'classfield',2);//商城统计
            $this->procedure_single($argv,'classfield',3);//物品统计
            $mysqlDB_log->close();
        }

        //全服统计开始：依赖分服统计，必须在分服统计之后
        //$this->procedure_all($argv['stime'],'phylum',1);//元宝排行榜
        //$this->procedure_all($argv['stime'],'classfield',2);//商城排行榜
        //$this->procedure_all($argv['stime'],'classfield',3);//物品排行榜
    }

    //分服统计
    function procedure_single($argv, $group, $type){
        $StatModel = new StatModel();

        $tabelName = "log_economy_{$argv['Ymd']}";

        //查询条件
        $where = "currency='yb' AND kingdom='expenditure'";
        if($type == 2){
            $where .= " AND phylum IN ('store','npc_store')";
        }elseif($type == 3){
            $where .= " AND phylum NOT IN ('store','npc_store')";
        }

        //获取总数，用来求比率
        $sql = "SELECT SUM(amount) AS amount FROM {$tabelName} WHERE {$where}";
        $query = $argv['mysqlDB_log']->query($sql)->fetch_assoc();
        $total = $query['amount'];

        if ($total) {
            $content = array();
            $rank = 1;

            $sql = "SELECT SUM(amount) AS amount,phylum,classfield FROM {$tabelName} WHERE {$where} GROUP BY {$group} ORDER BY amount DESC";
            $query = $argv['mysqlDB_log']->query($sql);
            while($res = $query->fetch_assoc()){
                $res['rank']=$rank;
                $res['radio']= round($res['amount']*100/$total,2);
                $rank ++;
                $content[] = $res;
            }
            $data = array(
                'logdate'  => date("Y-m-d",$argv['stime']),
                'type'     => $type,
                'serverid' => $argv['serverid'],
                'content'  => json_encode($content)
            );
            $StatModel->handle('replace', array('data'=>$data) ,'rank');
        }


    }

    //全服统计
    public  function procedure_all($etime,$group,$type){
        $StatModel = new StatModel();

        $where = "type={$type} AND unix_timestamp(logdate)={$etime} AND serverid != 999999999";

        $query = $StatModel->handle('getOne', array('fields'=>"SUM(amount) AS amount",'where'=>$where) ,'rank');

        $total = $query['amount'] ? $query['amount'] : 0;

        $sql = "SELECT SUM(amount) AS amount,`type`,logdate,phylum,classfield FROM bg_rank WHERE {$where} GROUP BY {$group} ORDER BY amount DESC";

        $res = $StatModel->handle('find', array('sql'=>$sql) ,'rank');

        if($res){
            foreach($res as $key=>$val){
                $val['serverid'] = 999999999;
                $val['rank'] = $key+1;
                $val['radio'] = round($val['amount']*100/$total,2);
                //print_r($val);
                $StatModel->handle('replace', array('data'=>$val) ,'rank');
            }
        }

    }

}
/* End of file RankcronController.class.php */
/* Location: ./controller/cron/RankcronController.class.php  */
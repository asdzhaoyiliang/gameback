<?php
/**
 * Class KeepcronController
 * 留存统计
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class KeepcronController extends CronController{

    public function run(array $argv = null){
        $stime = $argv['stime'] ? $argv['stime'] : $this->stime;

        //分服统计开始
        foreach($this->server_list as $row){
            $mysqlDB_log = new mysqli($row['mysql_host'],$row['mysql_user'], $row['mysql_passwd'],$row['log_table'],$row['mysql_port']);
            $mysqlDB_actor = new mysqli($row['mysql_host'],$row['mysql_user'], $row['mysql_passwd'],$row['actor_table'],$row['mysql_port']);
            if($mysqlDB_log->errno || $mysqlDB_actor->errno ){
                continue;
            }

            $argv=array(
                'mysqlDB_log'   => $mysqlDB_log,
                'mysqlDB_actor' => $mysqlDB_actor,
                'serverid'      => $row['server_id'],
                'stime'         => $stime,
                'etime'         => $stime+86400,
                'Ymd'           => date('Ymd',$stime),
                'Ym'            => date('Ym',$stime),
            );
            $this->procedure_single($argv);
        }

        //全服统计开始：依赖分服统计，必须在分服统计之后
        //$this->procedure_all($stime);
    }

    public function procedure_single($argv){
        //获取统计日登陆的账号
        $sql = "SELECT userid FROM log_login_" . $argv['Ymd'];
        $query = $argv['mysqlDB_log']->query($sql);
        while($row = $query->fetch_assoc()){
            $account_login[] = "'" . $row['userid'] . "'";
        }
        $argv['mysqlDB_log']->close();
        if( ! $account_login ) return;
        $account_login = implode( ",", $account_login);


        //7日
        $statModel = new StatModel();
        $aa = 0;
        $day7 = $argv['stime']-7*86400;
        $day7 = $day7<strtotime('2016-01-06') ? strtotime('2016-01-06') : $day7;

        for( $i = $argv['stime']; $i >= $day7; $i -= 86400){
            $aa++;
            $today     = $i;
            $yesterday = $i-86400;
            $where = "unix_timestamp(createtime) >= {$yesterday} AND unix_timestamp(createtime) < {$today}";

            //统计日的注册用户数
            $sql = "SELECT COUNT(*) AS num FROM actors WHERE {$where}";
            $query = $argv['mysqlDB_actor']->query($sql)->fetch_assoc();
            $data['account'] =  $query['num'];


            //留存数
            $sql .= " AND actorid IN ({$account_login})";
            $query = $argv['mysqlDB_actor']->query($sql)->fetch_assoc();
            $data['day'.$aa] =  $query['num'];

            $com['serverid'] = $argv['serverid'];
            $com['logdate'] = date("Y-m-d", $i-86400);

            $data = array_merge($data, $com);
            if( $statModel->handle("getOne", array('where'=>$com, 'fields'=>'serverid'), 'keep') ){
                $statModel->handle("update", array('data'=>$data), 'keep');
            }else{
                $statModel->handle("insert", array('data'=>$data), 'keep');
            }
            unset($data);
        }

        $argv['mysqlDB_actor']->close();
    }

    public function procedure_all($stime){
        $StatModel = new StatModel();

        $fields = "SUM(account) AS account";
        for( $i = 1; $i < 8; $i++){
            $fields .= ", SUM(day{$i}) AS day{$i}";
        }
        $yesterday = $stime-86400;
        $condition = array(
            'fields' => $fields,
            'where'  => "serverid != 999999999 AND unix_timestamp(logdate)={$yesterday}"
        );
        $data = $StatModel -> handle('getOne', $condition, 'keep');
        $data['serverid'] = 999999999;
        $data['logdate'] = date("Y-m-d", $yesterday);

        $StatModel->handle('replace', array('data'=>$data), 'keep');
    }

}
/* End of file KeepcronController.class.php */
/* Location: ./controller/cron/KeepcronController.class.php  */
<?php
/**
 * Class OnlinetimecronController
 * 在线时长
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class OnlinetimecronController extends CronController{

    public function run(array $argv = null){
        $stime = $argv['stime'] ? $argv['stime'] : $this->stime;

        //分服统计开始
        foreach($this->server_list as $row){
            $mysqlDB_log = new mysqli($row['mysql_host'],$row['mysql_user'], $row['mysql_passwd'],$row['log_table'],$row['mysql_port']);
            if($mysqlDB_log->errno){
                continue;
            }
            $mysqlDB_actor = new mysqli($row['mysql_host'],$row['mysql_user'], $row['mysql_passwd'],$row['actor_table'],$row['mysql_port']);
            if($mysqlDB_actor->errno ){
                continue;
            }
            $argv=array(
				'mysqlDB_actor' => $mysqlDB_actor,
                'mysqlDB_log'   => $mysqlDB_log,
                'serverid'      => $row['server_id'],
                'stime'         => $stime,
                'etime'         => $stime+86400,
                'Ymd'           => date('Ymd',$stime),
                'Ym'            => date('Ym',$stime),
            );
            $this->procedure_single($argv);
        }
    }

    public function procedure_single($argv){
        $table = "log_login_" . $argv['Ymd'];
        $sql = "SELECT userid,COUNT(*) AS num FROM {$table} WHERE logid = '7' GROUP BY userid";
        $query = $argv['mysqlDB_log']->query($sql);

        while( $row = $query->fetch_assoc()){
			$sql = "select zhanxunpoint from actors where actorid = '{$row['userid']}' ";
			$actorRow = $argv['mysqlDB_actor']->query($sql)->fetch_assoc();
			$val = 0;
			if($actorRow)
				$val = $actorRow['zhanxunpoint'];
            $content[] = array(
                'actorid'  => (int)$row['userid'],
                'times'    => (int)$row['num'],
                'num'      =>  $val
            );
        }
        $argv['mysqlDB_log']->close();
        if( !$content ) return;

        $data = array(
            'logdate'  => date("Y-m-d", $argv['stime']),
            'serverid' => $argv['serverid'],
            'content'  => json_encode($content),
        );
        (new StatModel())->handle('replace', array('data'=>$data), 'online_time');
    }

}
/* End of file OnlinetimecronController.class.php */
/* Location: ./controller/cron/OnlinetimecronController.class.php  */
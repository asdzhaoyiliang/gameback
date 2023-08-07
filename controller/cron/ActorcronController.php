<?php
/**
 * Class ActorcronController
 * 计划任务：把所有单服的角色统计到中央服
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class ActorcronController extends CronController{

    public function run(array $argv = null){
        $stime = $argv['stime'] ? $argv['stime'] : $this->stime;

        //分服统计开始
        foreach($this->server_list as $row){
            $mysqlDB_actor = new mysqli($row['mysql_host'],$row['mysql_user'], $row['mysql_passwd'],$row['actor_table'],$row['mysql_port']);
            if($mysqlDB_actor->errno ){
                continue;
            }
            $argv=array(
                'mysqlDB_actor' => $mysqlDB_actor,
                'serverid'      => $row['server_id'],
                'stime'         => $stime,
            );
            $this->procedure_single($argv);
        }
    }

    public function procedure_single($argv){
        //$where = "unix_timestamp(createtime)>={$argv['stime']} AND accountname NOT LIKE 'mytest%'";
        $where = "unix_timestamp(createtime)>={$argv['stime']}";
        $fields = "actorid,actorname,accountid,accountname,serverindex,createtime,sex,job,`level`,exp,bindcoin,";
        $fields .= "bindyuanbao,nonbindyuanbao,nonbindcoin,pkvalue,battlepower,vipgrade";

        $sql = "SELECT {$fields} FROM actors WHERE {$where}";
        $argv['mysqlDB_actor']->set_charset("utf8");
        $query = $argv['mysqlDB_actor']->query($sql);

        while($row = $query->fetch_assoc()){
            $data[] = $row;
        }
        $argv['mysqlDB_actor']->close();
        if($data)
            (new Model())->handle('insert', array('data'=>$data, 'bacth'=>TRUE), 'actors');
    }

}
/* End of file ActorcronController.class.php */
/* Location: ./controller/cron/ActorcronController.class.php  */
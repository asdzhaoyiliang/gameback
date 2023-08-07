<?php
/**
 * Class LevelcronController
 * 等级统计
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class LevelcronController extends CronController{

    public function __construct(){
        parent::__construct();
        $this->model = new Model();
    }

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
                'etime'         => $stime+86400,
            );
            $this->procedure_single($argv);
        }

        //全服统计开始：依赖分服统计，必须在分服统计之后
        //$this->procedure_all($stime);
    }

    //分服统计
    public function procedure_single($argv){
        $sql = "SELECT `level`,COUNT(*) AS num FROM actors GROUP BY `level`";
        $query = $argv['mysqlDB_actor']->query($sql);
        while($row = $query->fetch_assoc()){
            $content[] = array(
                'level' =>  (int)$row['level'],
                'num'   =>  (int)$row['num']
            );
        }
        $argv['mysqlDB_actor']->close();
        if( ! $content ) return;

        $data = array(
            'logdate'  => date("Y-m-d", $argv['stime']),
            'serverid' => $argv['serverid'],
            'content'  => json_encode($content)
        );
        $this->model->handle('replace', array('data'=>$data), 'stat_level');
    }

    //全服统计
    public  function procedure_all($stime){
        $condition = array(
            'fields' => "content",
             'where'=> "unix_timestamp(logdate) = {$stime} AND serverid != 999999999",
        );
        $res = $this->model->handle("getList", $condition, 'stat_level');

        if ($res) {
            $content = array();
            foreach ($res as $val) {
                $foo = json_decode($val['content'], true);
                foreach($foo as $v){
                    $tmp[$v['level']] += $v['num'];
                }
            }

            foreach($tmp as $key=>$val){
                $content[] = array(
                    'level' => $key,
                    'num'   =>  $val
                );
            }

            $data = array(
                'logdate'  => date("Y-m-d", $stime),
                'serverid' => 999999999,
                'content'  => json_encode($content)
            );
            $this->model->handle('replace', array('data'=>$data), 'stat_level');
        }
    }
}
/* End of file LevelcronController.class.php */
/* Location: ./controller/cron/LevelcronController.class.php  */
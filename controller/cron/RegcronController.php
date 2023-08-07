<?php
/**
 * Class RegcronController
 * 计划任务：注册 创角
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class RegcronController extends CronController{

    public function __construct(){
        parent::__construct();
        $this->model = new Model();
    }

    public function run(array $argv = null){
        $stime = $argv['stime'] ? $argv['stime'] : $this->stime;

        //分服统计
        foreach($this->server_list as $row){
            $mysqlDB_actor = new mysqli($row['mysql_host'],$row['mysql_user'], $row['mysql_passwd'],$row['actor_table'],$row['mysql_port']);
            if( $mysqlDB_actor->errno ){
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

        //全服统计：依赖分服统计，必须在分服统计之后
        //$this->procedure_all($stime);
    }

    //分服统计
    public function procedure_single($argv){
        $tmp = array();
        $where = "unix_timestamp(createtime) >= {$argv['stime']} AND unix_timestamp(createtime) < {$argv['etime']} ";
        $sql = "SELECT createtime FROM actors WHERE {$where} ";
        $query = $argv['mysqlDB_actor']->query($sql);
        while( $row = $query->fetch_assoc() ){
            $key = date("H", strtotime($row['createtime']));
            $tmp[$key] ++;
        }
        $argv['mysqlDB_actor']->close();
        if( ! $tmp ) return

        $total = 0 ;
        foreach($tmp as $key=>$val){
            $content[] = array(
                'hour'     => $key,
                'num'      => (int)$val
            );
            $total += $val;
        }
        $data = array(
            'logdate'  => date("Y-m-d" ,$argv['stime']),
            'serverid' => $argv['serverid'],
            'total'    => $total,
            'content'  => json_encode($content),
        );
        $this->model->handle('replace',array('data'=>$data),'stat_reg');

    }

    //全服统计
    public  function procedure_all($stime){
        $condition = array(
            'where'  => "unix_timestamp(logdate) = {$stime} AND serverid != 999999999",
            "fields" => "content",
        );
        $res = $this->model->handle("getList", $condition, 'stat_reg');

        if($res){
            $total = 0 ;
            foreach($res as $val){
                $foo = json_decode($val['content'], true);
                foreach($foo as $v){
                    $tmp[$v['hour']] += $v['num'];
                }
            }
            foreach($tmp as $key=>$val){
                $content[] = array(
                    'hour' => $key,
                    'num'   =>  $val
                );
                $total += $val;
            }
            $data = array(
                'logdate'  => date("Y-m-d", $stime),
                'serverid' => 999999999,
                'total'    => $total,
                'content'  => json_encode($content)
            );
            $this->model->handle('replace',array('data'=>$data),'stat_reg');
        }
    }

}
/* End of file RegcronController.class.php */
/* Location: ./controller/cron/RegcronController.class.php  */
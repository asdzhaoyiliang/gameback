<?php
/**
 * Class LogincronController
 * 登录统计
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */
class LogincronController extends CronController{

    public function __construct(){
        parent::__construct();
        $this->model = new Model();
    }

    public function run(array $argv = null){
        $stime = $argv['stime'] ? $argv['stime'] : $this->stime;

        //分服统计开始
        foreach($this->server_list as $row){
            $mysqlDB_log = new mysqli($row['mysql_host'],$row['mysql_user'], $row['mysql_passwd'],$row['log_table'],$row['mysql_port']);
            if($mysqlDB_log->errno ){
                continue;
            }
            $argv=array(
                'mysqlDB_log'   => $mysqlDB_log,
                'serverid'      => $row['server_id'],
                'stime'         => $stime,
                'Ymd'           => date('Ymd',$stime),
            );
            $this->procedure_single($argv);
        }

        //全服统计：依赖分服统计，必须在分服统计之后
        //$this->procedure_all($stime);
    }

    //分服统计
    public function procedure_single($argv){
        $table = "log_login_".$argv['Ymd'];
        $sql = "SELECT logdate FROM {$table}";

        $query= $argv['mysqlDB_log']->query($sql);
        while( $row = $query->fetch_assoc() ){
            $key = date("H", strtotime($row['logdate']));
            $tmp[$key] ++;
        }
        $argv['mysqlDB_log']->close();

        if( ! $tmp ) return;

        $total = 0;
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
            'content'  => json_encode($content)
        );
        $this->model->handle('replace',array('data'=>$data),'stat_login');

    }

    //全服统计
    public function procedure_all($stime){
        $condition = array(
            'where'  => "unix_timestamp(logdate) = {$stime} AND serverid != 999999999",
            "fields" => "content,total",
        );
        $res =  $this->model->handle("getList", $condition, 'stat_login');

        if($res){
            $total = 0;
            foreach($res as $val){
                $foo = json_decode($val['content'], true);
                foreach($foo as $v){
                    $tmp[$v['hour']] += $v['num'];
                }
                $total += $val['total'];
            }
            foreach($tmp as $key=>$val){
                $content[] = array(
                    'hour' => $key,
                    'num'   =>  $val
                );
            }
            $data = array(
                'logdate'  => date("Y-m-d", $stime),
                'serverid' => 999999999,
                'total'    => $total,
                'content'  => json_encode($content)
            );
            $this->model->handle('replace',array('data'=>$data),'stat_login');
        }
    }

}
/* End of file LogincronController.class.php */
/* Location: ./controller/cron/LogincronController.class.php  */
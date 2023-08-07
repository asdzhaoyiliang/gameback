<?php
/**
 * Class IntegratedcronController
 * 综合统计：总注册数/总创角数/注册数/创角数/今日登陆人数
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

/**
 * 注意：
 * 该计划任务依赖登录统计和注册统计，因此运行时必须在levelcron和regcron后面
*/
class IntegratedcronController extends CronController{

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
                'Ymd'           => date('Ymd',$stime),
            );
            $this->procedure_single($argv);
        }

        //全服统计开始：依赖分服统计，必须在分服统计之后
        //$this->procedure_all($stime);
    }

    //分服统计
    public function procedure_single($argv){
        $where = "unix_timestamp(createtime)<" . $argv['etime'];
        $fileds = "COUNT(*) AS num";

        //总角色数
        $sql = "SELECT {$fileds} FROM actors WHERE  {$where}";
        $res = $argv['mysqlDB_actor']->query($sql)->fetch_assoc();
        $total_role_num = $res['num'];

        //总注册数
        $sql = "SELECT {$fileds} FROM actors WHERE {$where}";
        $res = $argv['mysqlDB_actor']->query($sql)->fetch_assoc();
        $total_reg_num = $res['num'];

        //今日创角数
        $where1 = "unix_timestamp(createtime) >=" . $argv['stime'] . " AND " . $where;
        $sql = "SELECT {$fileds} FROM actors WHERE {$where1}";
        $res = $argv['mysqlDB_actor']->query($sql)->fetch_assoc();
        $role_num = $res['num'];

        $argv['mysqlDB_actor']->close();

        $model = new  Model();
        $where = "serverid = {$argv['serverid']} AND logdate = '" . date("Y-m-d", $argv['stime']) ."'";
        $condition = array(
            'where' => $where,
            'fields' => "SUM(total) AS num"
        );

        //今日注册数
        $statReg = $model -> handle('getOne', $condition, 'stat_reg');

        //今日登录人数
        $statLogin = $model -> handle('getOne', $condition, 'stat_login');

        //组织数据
        $data = array(
            'logdate'        => $argv['Ymd'],
            'serverid'       => $argv['serverid'],
            'total_role_num' => $total_role_num,
            'total_reg_num'  => $total_reg_num,
            'new_reg_num'    => $statReg['num'],
            'login_num'      => $statLogin['num'],
            'new_role_num'   => $role_num,
        );
        $model -> handle('replace', array('data'=>$data), 'integrated_data');
    }

    //全服统计
    public function  procedure_all($stime){
        $condition = array(
            'where'=>"unix_timestamp(logdate) = {$stime} AND serverid != 999999999",
            'fields'=>"SUM(new_reg_num) AS new_reg_num,
                     SUM(new_role_num) AS new_role_num,
                     SUM(total_role_num) AS total_role_num,
                     SUM(total_reg_num) AS total_reg_num,
                     SUM(login_num) AS login_num,
                     logdate"
        );
        $statModel = new  StatModel();
        $data = $statModel->handle('getOne', $condition, 'integrated_data');
        $data['serverid']=999999999;
        $statModel->handle('replace', array('data'=>$data), 'integrated_data');
    }

}
/* End of file IntegratedcronController.class.php */
/* Location: ./controller/cron/IntegratedcronController.class.php  */
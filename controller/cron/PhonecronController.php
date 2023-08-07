<?php
/**
 * Class LevelcronController
 * 等级统计
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class PhonecronController extends CronController{

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
                'Ymd'           => date("Ymd", $stime)
            );
            $this->procedure_single($argv);
        }

        //全服统计开始：依赖分服统计，必须在分服统计之后
        //$this->procedure_all($stime);
    }

    //分服统计
    public function procedure_single($argv){

        //------------------------------------
        // 把手机信息入库本地，通过唯一索引去重
        //------------------------------------
        $logdate = date("Y-m-d", $argv['stime']);

        $tableName = "log_counter_{$argv['Ymd']}";
        $fields = "logdate, actorid, user_level, value, extra, kingdom, phylum, classfield, family, genus";

        $sql = "SELECT {$fields} FROM {$tableName} WHERE counter='login' ";
        $query = $argv['mysqlDB_log'] -> query($sql);
        $data = array();
        while($row = $query->fetch_assoc()){
            $phone = explode("~", $row['kingdom']);
            $data[] = array(
                'logdate'       => $logdate,
                'serverid'      => $argv['serverid'],
                'actorid'       => $row['actorid'],
                'level'         => $row['user_level'],
                'version'       => $row['value'],
                'channel'       => $row['extra'],
                'phone_brand'    => $phone[0],
                'phone_type'    => $phone[1],
                'phone_version' => $row['phylum'],
                'dpi'           => $row['classfield'],
                'net_supplier'  => $row['family'],
                'net_type'      => $row['genus'],
                'login_date'    => $row['logdate'],
            );
        }
        if( ! $data ) return;

        for($i=0; $i <= count($data); $i+=1000){
            $da = array_slice($data, $i, 1000, TRUE);
            $this->model->handle('insert', array('data'=>$da, 'bacth'=> true), 'phone');
            sleep(1);
        }


        //------------------------------------
        // 统计手机信息
        //------------------------------------
        $where = "logdate='{$logdate}' AND serverid={$argv['serverid']}";
        $res = $this->model->handle('getList', array('where'=>$where), 'phone');
        if( ! $res ) return;

        $foo = $datas = array();
        foreach($res as $val){
            $brand = $val['phone_brand'];
            $type  = $val['phone_type'];
            $foo[$brand]['num'] ++;
            $foo[$brand]['type'][$type] ++;
        }
        foreach($foo as $key=>$val){
            $datas[] = array(
                'brand'         => $key,
                'brand_num'     => $val['num'],
                'type'          => $val['type']
            );
        }
        $value =  array(
            'logdate'  => $logdate,
            'serverid' => $argv['serverid'],
            'content'  =>json_encode($datas)
        );
        $this->model->handle('replace', array('data'=>$value), 'phone_stat');
    }

}
/* End of file LevelcronController.class.php */
/* Location: ./controller/cron/LevelcronController.class.php  */
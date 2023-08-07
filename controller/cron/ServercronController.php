<?php
/**
 * Class ServercronController
 * 服务器开服关服自动检测
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class ServercronController extends CronController{

    public function run(array $argv = null){
        $serverModel = new ServerModel();
        $bool = false;
        foreach ($this->server_list as $val) {
            $condition['where'] = "id = " . $val['id'];
            //开服
            if( $val['status'] == 0 && strtotime($val['open_time']) <= time() ){
                $condition['data'] = array('status'=>5);
                $serverModel -> handle('update', $condition, "server");
                $bool = true;
            }

            //关服
            if ( $val['status'] != 1 && strtotime($val['close_time']) <= time() ){
                $condition['data'] = array('status'=>1);
                $serverModel -> handle('update', $condition, "server");
                $bool = true;
            }
        }

        if ($bool) {
            $condition = array(
                'where'=>'status != 0',
                'fields'=>"server_id,server_ip,server_port,name,if(`status`=5,4,`status`)  as `status`,if(`status` = 5,1,0)  as `isNew`",
                'order' => 'server_id ASC'
            );
            $_SESSION['server_list_for_client'] = $serverModel->handle('getList',$condition, 'server');
        }
    }
}
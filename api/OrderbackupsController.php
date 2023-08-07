<?php
/**
 * Class OrderbackupsController
 * 订单备份
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @version 1.0
 * @since 2015-09-01
 */
class OrderbackupsController extends ApiController{

    function __construct(){
        parent::__construct();
    }

    public function save(){
        $param = $_REQUEST;
        unset($param['r'], $param['gamekey']);
        $data = array(
            'cp_orderid'  => $param['cp_orderid'],
            'actorid'     => (int)$param['actorid'],
            'channel'     => $param['channel'],
            'serverid'    => (int)$param['serverid'],
            'create_time' => date("Y-m-d H:i:s"),
            'return_data' => json_encode($param)
        );
        (new OrderModel())->handle('insert', array('data'=>$data), 'order_backups');
    }
}
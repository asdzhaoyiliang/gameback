<?php
/**
 * Class CronController
 * 计划任务抽象类，所有的计划任务都要继承它
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

abstract class CronController {

    public $server_list;//服务器列表

    public $stime;  //开始时间

    public function __construct() {
        $condition = array('where' => "status NOT IN (0)");  //开服条件
        //$condition = array('where' => "id=1");
        $this->server_list = (new ServerModel())->handle('getList',$condition, 'server');

        if(!$this->server_list) die("server is invalid");

        set_time_limit(0);
        $this->stime = strtotime("today");
        echo "[" . date('Y-m-d H:i:s') . "] executing " . get_called_class() . ".php\n";
    }

    abstract public function run(array $argv = null);

    public function __destruct() {
        echo "[" . date('Y-m-d H:i:s') . "] leaving " . get_called_class() . ".php\n";
    }

}
/* End of file CronController.class.php */
/* Location: ./controller/cron/CronController.class.php  */
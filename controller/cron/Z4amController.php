<?php
/**
 * Class Z4amController
 * 计划任务：凌晨4点计划任务
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class Z4amController extends CronController{

    public function run(array $argv = null){
        $controllers = array(
            'Actor',
            'Economy',
            'Keep',
            'Level',
            'Login',
            'Online',
            'Onlinetime',
            'Order',
            'Rank',
            'Reg',
            'Integrated', //综合统计依赖login和reg，必须在他们之后执行
            'Phone',
        );
        $this->work($controllers, strtotime("yesterday"));

/*        $controllers = array('Integrated');
        for( $i=strtotime('2016-01-07'); $i>=strtotime('2016-01-06'); $i -= 86400){
            $this->work($controllers, $i);
        }*/
    }

    function work(array $controllers,$stime=''){
        if(!$controllers ) return;
        $argv['stime'] = $stime ? $stime : strtotime("yesterday");
        foreach($controllers as $controller){
            $controller = ucfirst($controller)."cronController";
            (new $controller)->run($argv);
        }
    }

}
/* End of file Z4amController.class.php */
/* Location: ./controller/cron/Z4amController.class.php  */
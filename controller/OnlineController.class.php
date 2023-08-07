<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class OnlineController
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class OnlineController extends Controller {

    public function __construct() {
        parent::__construct();
        $this->OnlineModel = new OnlineModel();
    }

    // --------------------------------------------------------------------

    public function index() {
        $tabs = array(
            array('title' => '实时在线', 'url' => 'admin.php?ctrl=online&act=olrealtime'),
            array('title' => '综合在线', 'url' => 'admin.php?ctrl=online&act=olcomplex'),
            array('title' => '在线时长', 'url' => 'admin.php?ctrl=stat&act=onlineTime'),
        );
        $this->themeTabs($tabs);
    }

    // --------------------------------------------------------------------

    /*
     * 实时在线
     */
    public function olrealtime() {
        $this->smarty->assign('time', date('Y-m-d'));
        $this->smarty->assign('scp', $this->serverList(false));
        $this->smarty->display('online/olRealTime.tpl');
    }
    public function olRealTimeData(){
        if ($this->getParam('type') === "0"){
            $stime = time() - 24 * 3600;
        }else{
            $stime = strtotime($this->getParam('time'));
        }
        $server_id = $this->getParam('server_id') ? $this->getParam('server_id') : $this->currentServer();
        $this->validateServer($server_id);

        $onlineInfo = $this->OnlineModel->olData($stime,$server_id);

        require_once (ROOT . '/library/Highchart.php');
        $chart = new Highchart();
        $chart->chart->renderTo = 'olrealtime';
        $chart->chart->type = 'spline';
        $chart->chart->zoomType = 'x';
        $chart->title->text = "实时在线";   //标题
        $chart->xAxis->tickInterval = 12;   //横坐标，两个副标题之间划分多少份
        $chart->xAxis->categories = array_keys($onlineInfo['min']);//横坐标副标题
        $chart->series[] = array('name' => '人数', 'data' => array_values($onlineInfo['min']));//横坐标标题和数据
        $chart->yAxis->title->text = '在线人数';  //纵坐标标题
        $chart->plotOptions->spline->lineWidth = 1;
        $chart->plotOptions->spline->states->hover->lineWidth = 1.2;
        $chart->plotOptions->spline->marker->shadow = false;
        $chart->plotOptions->spline->marker->enabled = true;
        $chart->plotOptions->spline->marker->radius = 1.5;
        $chart->plotOptions->spline->marker->states->hover->enabled = true;
        $chart->plotOptions->spline->marker->states->hover->symbol = 'circle';
        $chart->plotOptions->spline->marker->states->hover->radius = 2;
        $chart->plotOptions->spline->marker->states->hover->lineWidth = 1;
        $chart->tooltip->shared = true;
        $chart->tooltip->crosshairs = true;

        $chart = $chart->render("chart2");
        $this->smarty->assign('chart', $chart);

        $this->smarty->assign('role', $onlineInfo['hour']);

        $this->smarty->display('online/olRealTimeData.tpl');
    }

    // --------------------------------------------------------------------

    /*
     * 综合在线
     */
    public function olcomplex(){
        $this->smarty->assign('sTime', date('Y-m-d', strtotime('last month'))); // 总共显示30天的数据
        $this->smarty->assign('eTime', date('Y-m-d'));
        $this->smarty->assign('scp', $this->serverList());
        $this->smarty->display('online/olComplex.tpl');
    }
    public function olcomplexData() {
        $type = $this->getParam('type');
        if ($type == 2) {
            $stime = strtotime($this->getParam('sTime'));
            $etime = strtotime($this->getParam('eTime'));
        }
        else if ($type == 4) {
            $stime = strtotime(date('Y-m-d', strtotime("-60 days")));
            $etime = strtotime("today");
        }
        else if ($type == 5) {
            $stime = strtotime(date('Y-m-d', strtotime("-90 days")));
            $etime = strtotime("today");
        }
        $server_id = $this->getParam('server_id') ? $this->getParam('server_id') : $this->currentServer();
        $this->validateServer($server_id);

        $data = $this->OnlineModel->olDatac($stime, $etime,$server_id);
        $this->smarty->assign('chart', $data);
        $this->smarty->display('online/olComplexData.tpl');
    }

}
/* End of file OnlineController.php */
/* Location: ./controller/OnlineController.php  */
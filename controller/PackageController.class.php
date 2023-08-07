<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class PackageController 支付开关

 */

class PackageController extends Controller {

    public function __construct() {
        parent::__construct();
        $this->LogModel = new LogModel();
        $this->PackageModel = new Model();
    }

    public function index() {
        $tabs = array(
            array('title' => '支付开关列表', 'url' => 'admin.php?ctrl=package&act=package_list'),
        );
        $this->themeTabs($tabs);
    }

    /**
     * 列表
     */
    function package_list(){
        $package = $this->PackageModel->handle('getList',array(), 'package');
        $this->smarty->assign('package', $package);
        $this->smarty->display('package/edit.tpl');
    }


    public function submit(){
        switch($_REQUEST['type']){
            case 'add':
                $name = trim($_POST['name']);
                $flag = trim($_POST['flag']);

                //if(empty($name)) exit("必须填写支付渠道");
                if( $this->PackageModel->handle('getOne',array('where'=>"flag='{$flag}'"), 'package') ){
                    exit("包名不能重复，请更换");
                }
                $data = array(
                    'name'         => $name,
                    'flag'         => $flag,
                    'created_time' => date("Y-m-d H:i:s",time()),
                );

                $this->PackageModel->handle('insert',array('data'=>$data), 'package');
                $this->LogModel->logAdd("添加支付开关名称:{$name}");
                break;
            case 'del':
                $id = $_POST['id'];
                $this->PackageModel->handle('delete',array('where'=>"id={$id}"), 'package');
                $this->LogModel->logAdd("删除支付开关id:$id");
                break;
        }
    }

}
/* End of file ChannelController.class.php */
/* Location: ./controller/ChannelController.class.php  */

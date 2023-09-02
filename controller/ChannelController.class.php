<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class ChannelController 渠道管理
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class ChannelController extends Controller {

    public function __construct() {
        parent::__construct();
        $this->LogModel = new LogModel();
        $this->ChannelModel = new Model();
    }

    public function index() {
        $tabs = array(
            array('title' => '渠道列表', 'url' => 'admin.php?ctrl=channel&act=channel_list'),
        );
        $this->themeTabs($tabs);
    }

    /**
     * 渠道列表
     */
    function channel_list(){
        $channel = $this->ChannelModel->handle('getList',array(), 'channel');
        $this->smarty->assign('channel', $channel);
        $this->smarty->display('channel/edit.tpl');
    }


    public function submit(){
        switch($_REQUEST['type']){
            case 'add':
                $name = trim($_POST['name']);
                $flag = trim($_POST['flag']);

                if(empty($name)) exit("必须填写渠道名称");
                if(empty($flag)) exit("必须填写渠道名称");
                if( $this->ChannelModel->handle('getOne',array('where'=>"flag='{$flag}'"), 'channel') ){
                    exit("标识不能重复，请更换");
                }
                $data = array(
                    'name'         => $name,
                    'flag'         => $flag,
                    'created_time' => date("Y-m-d H:i:s",time()),
                );

                $this->ChannelModel->handle('insert',array('data'=>$data), 'channel');
                $this->LogModel->logAdd("添加渠道信息，渠道名称:{$name}");
                Util::requestGame();
                break;
            case 'del':
                $id = $_POST['id'];
                $this->ChannelModel->handle('delete',array('where'=>"id={$id}"), 'channel');
                $this->LogModel->logAdd("删除渠道，渠道id:$id");
                break;
        }
    }

}
/* End of file ChannelController.class.php */
/* Location: ./controller/ChannelController.class.php  */

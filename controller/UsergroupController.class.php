<?php defined('IN_WEB') ||  exit('Access Denied');
/**
 * Class UsergroupController
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class UsergroupController extends Controller{

    function __construct(){
        parent::__construct();
        $this->usergroupModel = new UsergroupModel();
        $this->logModel = new LogModel();
    }

    // --------------------------------------------------------------------

    public function index(){
        $tabs = array(
            array('title' => '用户组列表',      'url' => 'admin.php?ctrl=usergroup&act=groups_list'),
        );
        $this->themeTabs($tabs);
    }

    // --------------------------------------------------------------------

    /**
     * 用户组列表
     */
    public function groups_list(){
        $this->smarty->assign('groupList',  $this->usergroupModel->handle('getList',array(), 'user_group') );
        $this->smarty->display('usergroup/usergroup.tpl');
    }

    // --------------------------------------------------------------------

    /**
     * 编辑
     */
    public function edit(){
        $groupid = intval($_GET['groupid']);
        $usergroup = $groupid ? $this->usergroupModel->handle('getOne',array('where'=>"groupid={$groupid}"), 'user_group') : array();

        $this->smarty->assign('usergroup', $usergroup);
        $this->smarty->display('usergroup/edit.tpl');
    }
    public function edit_submit(){
        $_POST['name'] || exit('名称必须填写');

        //处理ip白名单
        $allow_ip = textareaStrToArr($_POST['allow_ip']);

        //默认数据
        $data = array(
            'name' => trim($_POST['name']),
            'description' => trim($_POST['description']),
            'allow_ip' => serialize($allow_ip),
        );
        //复制用户组权限
        $copy_usergroup = intval($_POST['copy_usergroup']);
        if($copy_usergroup){
            $tmp_data = $this->usergroupModel->groupGetOne($copy_usergroup);

            if($tmp_data){
                $data['center_permit'] = $tmp_data['center_permit'];
                $data['center_modules'] = $tmp_data['center_modules'];
            }
        }

        $groupid = intval($_POST['groupid']);
        if($groupid){
            $result = $this->usergroupModel->handle('update',array('data'=>$data,'where'=>"groupid={$groupid}"),'user_group');
            echo $result? 'success': '修改失败';
            $this->logModel->logAdd("修改用户组:{$data['name']}");
        }else{
            $data['created'] = time();
            $result = $this->usergroupModel->handle('insert',array('data'=>$data), 'user_group');
            echo $result? 'success': '添加失败';
            $this->logModel->logAdd("添加用户组:{$data['name']}");
        }
    }

    // --------------------------------------------------------------------

    /**
     * 删除用户
     */
   public  function delete(){
        $groupid = intval($_POST['groupid']);
        $result = $this->usergroupModel->handle('delete',array('where'=>"groupid={$groupid}"),'user_group');

        echo $result? 'success': 'fail';
        $this->logModel->logAdd("删除用户组，groupid：{$groupid}");
    }

}
/* End of file UsergroupController.class.php */
/* Location: ./controller/UsergroupController.class.php  */
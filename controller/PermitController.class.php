<?php defined('IN_WEB') ||  exit('Access Denied');
/**
 * Class PermitController
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class PermitController extends Controller{

    function __construct(){
        parent::__construct();
        $this->PermitModel = new PermitModel();
        $this->usergroupModel = new UsergroupModel();
        $this->LogModel = new LogModel();
    }

    // --------------------------------------------------------------------

    function index(){
        $tabs = array(
            array('title' => '权限列表', 'url' => 'admin.php?ctrl=permit&act=permit_list'),
            array('title' => '增加权限列表', 'url' => 'admin.php?ctrl=permit&act=permit_add'),
            array('title' => '用户组权限分配', 'url' => 'admin.php?ctrl=permit&act=usergroup&type=center'),
        );
        $this->themeTabs($tabs);
    }

    // --------------------------------------------------------------------

    /**
     * 权限列表
     */
    function permit_list(){
        $list = $this->PermitModel->permitTree();
        $this->smarty->assign('list', $list);
        $this->smarty->assign('type', 'center');
        $this->smarty->display('permit/permit_list.tpl');
    }

    // --------------------------------------------------------------------

    /**
     * 增加权限
     */
    function permit_add(){
        $this->smarty->assign('type', 'center');
        $this->smarty->display('permit/permit_add.tpl');
    }
    function permit_add_submit(){
        $group = trim($_POST['group']);
        $name = trim($_POST['name']);
        $type = trim($_POST['type']);
        $modules = textareaStrToArr($_POST['modules']);

        if(empty($group)) exit("分组不能为空");
        if(empty($name))  exit("权限名称不能为空");
        if(empty($type))  exit("请刷新页面重新添加权限");

        $data = array(
            'type'    =>  $type,
            'group'   =>  $group,
            'name'    =>  $name,
            'modules' =>  serialize($modules),
            'created' =>  time(),
        );

        $result = $this->PermitModel->handle('insert', array('data'=>$data), 'permit');
        echo $result? '添加成功': '添加失败';
        $this->LogModel->logAdd("添加权限:{$name}");
    }

    // --------------------------------------------------------------------

    /**
     * 删除权限
     */
    function permit_delete(){
        $pid = trim($_POST['pid']);
        $result = $this->PermitModel->handle('delete', array('where'=>"pid=$pid"), 'permit');
        echo $result? 'success': 'fail';
        $this->LogModel->logAdd("删除权限:{$pid}");
    }

    // --------------------------------------------------------------------

    /**
     * 修改权限
     */
    function save_field(){
        $pid = intval($_POST['id']);
        $field = trim($_POST['field']);
        $value = trim($_POST['value']);

        if($pid <= 0){
            echo 'pid error';
            return;
        }
        $return = $this->PermitModel->permitUpdate($pid, $field, $value);
        if($field == "modules"){
            $value = str_replace("\n", " | ", $value);
        }
        echo $return? $value: "save error";
        $this->LogModel->logAdd("修改权限：{$field}=>{$value}，权限id:{$pid}");
    }

    // --------------------------------------------------------------------

    function get_module_textarea(){
        $pid = intval($_GET['id']);
        $field = trim($_GET['field']);

        if($pid <= 0 || $field != "modules")xit( "param error");

        $permit = $this->PermitModel->handle('getOne', array('where'=>"pid=$pid"), 'permit');
        echo implode("\n", unserialize($permit["modules"]));
    }

    // --------------------------------------------------------------------


    /**
     * 用户组权限
     */
    function usergroup(){
        $groupid = intval($_GET['groupid']);
        $usergroup = $groupid ? $this->usergroupModel->groupGetOne($groupid) : array();
        $this->smarty->assign('usergroup', $usergroup);
        $this->smarty->assign('groupList', $this->usergroupModel->handle('getList', array(), 'user_group') );
        $this->smarty->assign('centerPermitList', $this->PermitModel->permitTree());

        $this->smarty->display('permit/usergroup.tpl');
    }

    // --------------------------------------------------------------------

    function group_permit_save(){
        $result = $this->usergroupModel->permitUpdate($_POST['groupid'], $_POST['type'], $_POST['permits'], isset($_POST['permit_all']));
        echo $result? '修改成功': '修改失败';
        $this->LogModel->logAdd("修改用户组权限:(groupid:{$_POST['groupid']}) {$_POST['type']}");
    }

    // --------------------------------------------------------------------

    function update_all_group(){
        echo $this->usergroupModel->updateAllGroup();
        $this->LogModel->logAdd("更新所有用户组权限");
    }
}
/* End of file PermitController.class.php */
/* Location: ./controller/PermitController.class.php  */
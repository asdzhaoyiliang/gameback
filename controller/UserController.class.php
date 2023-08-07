<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class UserControlle 后台用户管理
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class UserController extends Controller{

	function __construct(){
		parent::__construct();
		$this->userModel = new UserModel();
	}

    // --------------------------------------------------------------------
	
	public function index(){
        $tabs = array(
            array('title' => "用户列表", 'url' => "admin.php?ctrl=user&act=showPage&type=uers_list"),
            array('title' => "添加用户", 'url' => "admin.php?ctrl=user&act=showPage&type=add_use"),
            array('title' => "修改密码", 'url' => "admin.php?ctrl=user&act=showPage&type=alter_password"),
        );
        $this->themeTabs($tabs);
	}

    // --------------------------------------------------------------------

    public function showPage(){
        $type = $_REQUEST['type'];

        switch($type){
            case 'alter_password':
                break;
            case 'add_use':
                $this->smarty->assign('expiration', date('Y-m-d', strtotime('+1 year')));  //默认有限期为1年
                break;
            case 'uers_list':
                $this->smarty->assign('list', $this->userModel->getData());
                break;
        }

        $group = $this->userModel->handle('getList', array('fields'=>'groupid,name'), 'user_group');
        foreach($group as $val){
            $new_group[$val['groupid']] = $val['name'];
        }
        $this->smarty->assign('groupNames', $new_group); //用户组

        $this->smarty->display("user/$type.tpl");
    }

    // --------------------------------------------------------------------

    public function alterPassword(){
        $group = $this->userModel->handle('getList', array('fields'=>'groupid,name'), 'user_group');
        foreach($group as $val){
            $new_group[$val['groupid']] = $val['name'];
        }
        $this->smarty->assign('groupNames', $new_group); //用户组

        $this->smarty->display("user/alter_password.tpl");
    }

    // --------------------------------------------------------------------

	//处理数据
	public function submit(){
		$param = $_POST;
		$msg =   'Error:Invalid Parameter';
		$log_msg = '';
		@$uid =   intval($param['id'])  ? intval($param['id'])  : (intval($param['uid']) ? intval($param['uid']) : '');
		@$value = trim($param['value']) ? trim($param['value']) : '';

		switch($_REQUEST['type']){
			case 'alter_password': /** 修改密码 **/
				$result = $this->userModel->changePassword($_POST);
                $array = array(
                    1   => 'success',
                    -1  => '修改密码失败',
                    -2  => '原始密码错误',
                    -3  => '两次输入密码不相同',
                    -4  => '不能修改，您在'.$result['msg'].'使用过该密码',
                    -11 => '密码长度需要大于'.PASSWORD_LENGTH.'位字符',
                    -12 => '密码必须同时包含数字和字母',
                );
                $msg = $array[$result['code']] ? $array[$result['code']] : '未知错误';
				$log_msg = "修改密码";
				break;
			case 'clear_login_err': /** 清除错误记录 **/
                $username = $param['username'];
                $where = "`username` = '{$username}' AND created >= ".(time()-3600);
                $this->userModel->handle('delete', array('where'=>$where), 'failed_login');

                $msg =  "Success";
                $log_msg = "清空用户错误登录次数，username：$username}";
				break;
			case 'reset_password': /** 重置密码 **/
			    $msg =  $this->userModel->resetPassword($uid);
                $log_msg = "重置用户密码，uid：{$uid}";
				break;
			case 'delete_user': /** 删除账号 **/
                $res = $this->userModel->handle('delete', array('where'=>"uid=$uid"), 'user');

                $msg = $res ? 'Success' :  'Error:Delete Failed';
                $log_msg = "删除用户，uid：{$uid}";
				break;
			case 'ben_user': /** 封禁账号 **/
                $data = array('uid' => $uid, 'status' => $value);
                $this->userModel->userUpdate($data);

                $msg =  $value;
                $log_msg = "修改用户:status=>{$value},uid:{$uid}";
				break;
			case 'delay_account':/** 延长有效期 **/
                $sql = "UPDATE bg_user SET expiration = expiration + 86400*30 WHERE uid = {$uid}";
                $this->userModel->handle('query', array('sql'=>$sql));

                $msg = date('Y-m-d', strtotime($_POST['expiration_format'])+86400*30);
                $log_msg = "账户续期，uid：{$uid}";
				break;
			case 'alter_userGrounp':/** 修改用户组 **/
                $data = array('uid' => $uid,'groupid' => $value);
                $this->userModel->handle('update', array('data' => $data), 'user');

                $groupNames = $this->userModel->handle('getOne', array('where'=>"groupid=$value"), 'user_group');
                $msg =  $groupNames['name'];
                $log_msg = "修改用户:groupid=>{$value},uid:{$uid}";
				break;
			case 'alter_department':/** 修改部门 **/
                $data = array('uid' => $uid,'department' => $value);
                $this->userModel->handle('update', array('data' => $data), 'user');

                $msg =  $value;
                $log_msg = "修改用户:department=>{$value},uid:{$uid}";
				break;
			case 'add_user': /** 添加用户 **/
				$result = $this->userModel->addUser($param);
				switch($result['code']){
					case 1:
						$msg = '添加用户成功，密码为：'.$result['msg'];
						break;
					case -1:
						$msg = '添加失败';
						break;
					case -2:
						$msg = '已存在的用户名';
						break;
					case -3:
						$msg = '两次输入密码不相同';
						break;
					case -5:
						$msg = '有效期需在今天之后';
						break;
					case -6:
						$msg = '用户名只能为小写字母数字和下划线3-14位';
						break;
					default:
						$msg = '未知错误';
				}
				$log_msg = "添加用户:{$param['username']}";
				break;
			default:
				$msg =   'Error:Invalid Parameter';
				$log_msg = '';
				break;
		}
        (new LogModel()) -> logAdd($log_msg);
		echo $msg;
	}
}
/* End of file UserController.class.php */
/* Location: ./controller/UserController.class.php  */
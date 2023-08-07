<?php defined('IN_WEB') ||  exit('Access Denied');
/**
 * Class IndexController
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class IndexController extends Controller{

	function __construct(){
		parent::__construct();
		$this->loginModel = new LoginModel();
        $this->admin_url = 'admin.php';
    }

	/**
	 * 后台的整个框架
	 */
	function index(){
        global $current_language, $language_arr;

	    $this->smarty->assign('current_language', $current_language);
	    $this->smarty->assign('language_arr', $language_arr);
	    $this->smarty->assign('menuTree', (new MenuModel())->menuTree(MENU_TYPE_CENTER, 0, false));
	    $this->smarty->assign('web_name', WEB_NAME);
		$this->smarty->display('index.tpl');
	}

	/**
	 * 用户登录
	 */
	function login(){
		if(empty($_POST['login_token'])){
		    //打开登录页面
			$this->loginModel->logout();
		}else{
		    //登录操作
	        $result = $this->loginModel->doLogin(trim($_POST['username']), trim($_POST['password']), true);

            ( new LogModel()) -> logAdd("登录后台， 用户:{$_POST['username']}， 登录结果：{$result}");
	        switch ($result){
	            case 'can not login':
	                $msg = '不允许的登录';
	                break;
	            case 'user error':
	                $msg = '用户名密码错误';
	                break;
	            case 'verification code error':
	                $msg = '验证码错误';
	                break;
	            case 'status error':
	                $msg = '账号异常';
	                break;
                case 'expirate':
                    $msg = '账号过期';
                    break;
                case 'fail login many times':
                    $msg = '错误登录次数过多,已被系统列入黑名单';
                    break;
                case 'no server permission':
                    $msg = '没有权限';
                    break;
	            case 'success':
                    setcookie('_username', trim($_POST['username']), time() + 15552000);
	                header('Location:'.$this->admin_url);
	                exit();
	                break;
	            default:
	                $msg = '未知登录错误'.$result;
	        }
		}

		$this->loginModel->sessionDo('set', 'verification_code', random(6));

		$this->smarty->assign('login_token', $this->loginModel->makeLoginToken());
		$this->smarty->assign('msg', $msg);

		$this->smarty->display('login.tpl');
	}

	/**
	 * 根据用户状态判断是否需要验证码
	 */
    function user_status(){
        $user = $_GET['username'] !== '' ? trim($_GET['username']) : $_COOKIE['_username'];

        $user && $hasFailed = $this->loginModel->failedLogin('', $user, 'failedLogin5times');

        $ret['verify'] = ($_COOKIE['_username'] != $user || !$hasFailed ) ? true : false;

        if($ret['verify']){ //需要验证码验证
            if($this->loginModel->sessionDo('get', 'login_verify'))
                $this->loginModel->sessionDo('del', 'login_verify');
        }else{//标示为不需要验证码
            $this->loginModel->sessionDo('set', 'login_verify', true);
        }
        echo json_encode($ret);
    }

	/**
	 * 获取验证码
	 */
	function verification_code(){
		require_once(ROOT.'/library/ValidationCode.class.php');
		$verifyCode = new verifyCode();
        $verifyCode->font = ROOT.'/style/font/ariblk.ttf';
        $verifyCode->height = 32;
        $verifyCode->createVerify();
		$this->loginModel->sessionDo('set', 'verification_code', $verifyCode->getVerify());
        $verifyCode->outputVerify();
	}

	
	function item_info(){
		$content = trim($_POST['content']);
		//内容为空时不进行查找，节省资源
        if(empty($content)){
            echo "输入内容为空";
            return;
        }
        
        //根据道具id精确查找
		$itemJson = Util::getJson(ROOT . '/../../../server/config/item/item.json');
		if(preg_match("/^\d+$/i", $content)){
		    $itemName = $itemJson[$content]['name'];
			if (empty($itemName)) {
			    $itemName = "没有找到相关道具";
			}
			echo $itemName;
			return;
		}
		
		
		//根据道具名称模糊搜索
		echo "<table>";
		$data = "";
		foreach($itemJson as $id=>$value){
			if(!(strpos($value['name'], $content) === false)){
			    $data .= "<tr><td>{$id}</td><td>{$value['name']}</td><tr>";
			}
			
		}
		
		if($data){
		    echo $data;
		}else{
            echo '<tr><td>没有找到相关道具</td></tr>';		    
		}
		echo "</table>";
	}

	/**
	 * 导出excel
	 */
	public function exportStr(){
		$tabCss = '<style>table{border-collapse:collapse;border:0;margin:0;}td{ border:#000 solid 0.5pt; padding:5px;}</style>';
		fputexcel($_POST['fileName'], $tabCss.$_POST['str'], 'str');
	}
}

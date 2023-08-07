 <?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class FlushController
 * 刷新
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class FlushController extends Controller{
    function __construct(){
        parent::__construct();
        $this->LogModel = new LogModel();
    }
    
    function index(){
        $tabs = array(
            array('title'=>'刷新','url'=>'admin.php?ctrl=flush&act=item'),
        );
        $this->themeTabs($tabs);
	}

    function item(){
        $array = array(
            MSS_PAY  =>  '发放元宝(参数1：角色 ，参数2： 数量)',
			MSS_DELAY_UPHOLE => '维护倒计时(param倒计时秒数)',
			MSS_CANLCE_UPHOLE => '取消维护倒计时',
			MSS_CLOSE_NOTICE => '删除所有公告',
			MSS_RELOAD_FUNCTION => '刷新功能脚本(热更)',
			MSS_RELOAD_SHOP  => '加载商城物品',
			MSS_SET_EXPRATE => '经验倍率(param为倍率，1表示1倍，2表示2倍)',
			MSS_RELOAD_MONSTER_SCRIPT =>'怪物脚本刷新',
            MSS_RELOAD_ABUSEINFORMATION =>'过滤词库刷新',
			MSS_OPEN_COMMONSERVER => '开启跨服',
			MSS_CLOSE_COMMONSERVER => '关闭跨服',	
            MSS_SET_REFRESHCORSS => '刷新跨服配置'
        );
        $this->smarty->assign('server',$this->multiSelectServer());
        $this->smarty->assign('item',$array);
        $this->smarty->display('flush/index.tpl');
    }

    function submit(){
        $post = $_POST['data'];

        $server = explode(',',$post['serverid']);

        $data = array(
            'operindex'=>$post['item'],
			'nstate' => "1",
			'reser1' => "1",
			'strcom' => $post['param'],
			'username' => "",
			'logdate' => date("Y-m-d")
        );
        foreach($server as $val){
            if(!$val) continue;
			if($post['item'] == '10096'){
                $ser = (new ServerModel())->handle('getOne',array("where"=>"server_id={$val}"), 'server');
                $mysql = Util::getMysqlCon($ser['mysql_host'],$ser['mysql_user'],$ser['mysql_passwd'],$ser['actor_table'],$ser['mysql_port']);
				$sql = "SELECT actorid FROM actors WHERE actorname = '{$post['param']}'";
                $row = $mysql->query($sql)->fetch_assoc();
				if(!row){
					exit("角色名不存在");
				}
				$data['strcom'] = $post['param2'];
				$data['username'] = $row['actorid'];
			}
            $data['serverindex'] = $val;
            Util::sync('command',$val,$data);
        }
        echo 'success';
		$log = $post['item'] . "-".$post['param']."-".$post['param2'];
        $this->LogModel->logAdd("刷新：{$log}");
    }
}

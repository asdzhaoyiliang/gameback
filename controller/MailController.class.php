<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class MailController
 * 邮件系统
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class MailController extends Controller{

    function __construct(){
        parent::__construct();
        $this->LogModel = new LogModel();
        $this->MailModel = new MailModel();
    }

    public function index() {
        $tabs = array(
            array('title' => '发送邮件', 'url' => 'admin.php?ctrl=mail&act=send_mail'),
            array('title' => '全服邮件', 'url' => 'admin.php?ctrl=mail&act=server_mail'),
            array('title' => '发送记录', 'url' => 'admin.php?ctrl=mail&act=mail_list'),
        );
        //$this->themeTabs($tabs);
    }

    //个人邮件
    public function role_mail() {
        $tabs = array(
            array('title' => '发送邮件', 'url' => 'admin.php?ctrl=mail&act=add&type=mail'),
            array('title' => '发送记录', 'url' => 'admin.php?ctrl=mail&act=getlist&type=role_mail'),
        );
        $this->themeTabs($tabs);
    }

    //单服邮件
    public function server_mail() {
        $tabs = array(
            array('title' => '发送邮件', 'url' => 'admin.php?ctrl=mail&act=send_server_mail'),
            array('title' => '发送记录', 'url' => 'admin.php?ctrl=mail&act=getlist&type=server_mail'),
        );
        $this->themeTabs($tabs);
    }

    //资源管理
    public function resource() {
        $tabs = array(
            array('title' => '资源申请', 'url' => 'admin.php?ctrl=mail&act=add&type=resource'),
            array('title' => '申请记录', 'url' => 'admin.php?ctrl=mail&act=getlist&type=resource'),
        );
        $this->themeTabs($tabs);
    }

    //发送记录
    public function getlist() {
        $searchFields = [
            ['type'=>'server','title'=>'服务器','value'=>$this->serverList()],
            ['title' => '发送时间', 'type' => 'range_date'],
        ];

        $showFields = array(
            'a'  => array('title' => 'ID','sortable'=>true,'width'=>'40px'),
            'b'  => array('title' => '服务器','sortable'=>true,'width'=>'80px'),
            'c'  => array('title' => '邮件内容'),
            'g'  => array('title' => '附件'),
            'h'  => array('title' => '发送人','width'=>'40px'),
            'i'  => array('title' => '发送时间','sortable'=>true,'width'=>'60px'),
            'j'  => array('title' => '审核者','width'=>'60px'),
            'k'  => array('title' => '状态','sortable'=>true,'width'=>'60px'),
            'l'  => array('title' => '操作'),
        );

        switch($this->getParam('type')){
            case 'role_mail':
                $showFields['d'] = array('title' => '角色/账号');
                break;
            case 'server_mail':
                $showFields['d'] = array('title' => '赠送条件');
                break;
            case 'resource':
                $showFields['d'] = array('title' => '角色/账号');

                break;
        }

        ksort($showFields);
        $ajaxSource = "admin.php?ctrl=mail&act=mail_list_data&type=".$this->getParam('type');
        $js=<<<ECO
        function checkMail(id,type){
            if(confirm('确定操作该邮件?')){
                var t = type ? 1 : 0;
                $.post("admin.php?ctrl=mail&act=check",{id:id,type:t},function(msg){
                    if(msg == 'success'){
                         $("#tabs").tabs().tabs("load",1);
                    }else{
                        alert(msg);
                    }
                })
            }
        }
ECO;
        $otherData['js']=$js;
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData, true);
    }
    public function mail_list_data() {
        switch($this->getParam('type')){
            case 'role_mail':
                $orderF=array( 0=>'id',1=>'serverid',2=>'type',6=>'logdate',8=>'status');
                break;
            case 'server_mail':
                $orderF=array( 0=>'id',1=>'serverid',2=>'type',6=>'logdate',8=>'status');
                break;
            case 'resource':
                $orderF=array( 0=>'id',1=>'serverid',5=>'logdate',6>'status');
                break;
        }
        $condition = array('ServerIsNotNeed'=>true);
        echo $this->MailModel->getData(
            $this->_DataTablesCondition($_GET,$orderF,'*',$condition),
            $this->getParam('type'));
    }

    //增加邮件、资源申请
    public function add() {
        $this->smarty->assign('moneyType', CDict::$moneyType);
        $this->smarty->assign('type', $this->getParam('type'));
        $this->smarty->assign('server', $this->serverList());
        $this->smarty->display('mail/add.tpl');
    }
    public function add_submit(){
        $foo = $_POST['data'];
        $item_str = "";
        if($foo['gold']){
            $item[]=array('type'=>5,'sort'=>0, 'num'=>$foo['gold']);   
            $item_str .= CDict::$moneyType['gold'] . " x {$foo['gold']};";
        }
        if($foo['yuanbao']){
            $item[]=array('type'=>10,'sort'=>0, 'num'=>$foo['yuanbao']);   
            $item_str .= CDict::$moneyType['yuanbao'] . " x {$foo['yuanbao']};";
        }
        if( $foo['item']){
            foreach($foo['item'] as $val){
                $item_name = explode("|",$val[0]);
                $item[]=array('type' => 0,'sort' =>$item_name[0], 'num' =>$val[1],'bind'=>$val[2]);
                $item_str .= "{$item_name[1]} x {$val[1]}；";
            }
        }
        count($item) > 5 && exit("金钱和道具的总数不能超过5个！");

       if($foo['type'] == 'resource'){
           $tmp['type'] = 2;
           $tmp['senderid'] = $_SESSION['uid'];

           $log_desc = '资源申请';
       }elseif($foo['type'] == 'mail'){
           $tmp['type'] = 0;
           $tmp['senderid'] = $_SESSION['uid'];
           $log_desc = '发送个人邮件';
       }else{
           $tmp['type'] = 1;
           $tmp['senderid'] = 0;
           $log_desc = '发送全服邮件';
       }

        $content = array(
            'condition'=>$foo['condition'],
            'rolelist'=>$foo['rolelist'],
            'title'=>$foo['title'],
            'content'=>$foo['content'],
            'serverid'=>$foo['serverid'],
            'limit_level'=>$foo['limit_level'] ? $foo['limit_level'] : '',
            'item'=>$item,
        );

        $data=array(
            'data'=>serialize($content),
            'logdate'=>date('Y-m-d H:i:s',time()),
            'status'=>0,
            'serverid'=>$foo['serverid'],
            'item'=>$item_str
        );
        $data = array_merge($data,$tmp);
        $res = $this->MailModel->handle('insert',array('data'=>$data), 'mail');

        if($res){
            echo 'success';
            $log_desc .=" 成功";
        }else{
            echo 'fail';
            $log_desc .=" 失败";
        }
        $this->LogModel->logAdd($log_desc);
    }

    //全服邮件
    public function send_server_mail(){
        $this->smarty->assign('moneyType', CDict::$moneyType);
        $this->smarty->assign('server', $this->multiSelectServer());
        $this->smarty->display('mail/server_mail.tpl');
    }
    public function server_mail_submit(){
        $foo = $_POST['data'];

        $foo['yuanbao'] && $item[]=array('type'=>10,'sort'=>0, 'num'=>$foo['yuanbao']);
        $foo['gold']    && $item[]=array('type'=>5,'sort'=>0, 'num'=>$foo['gold']);
		exit("sssss");
        if( $foo['item']){
            foreach($foo['item'] as $val){
                $item[]=array('type' =>1,'sort' =>$val[0], 'num' =>$val[1],'bind'=>$val[2]);
            }
        }

        if(count($item) > 4) exit("金钱和道具的总数不能超过4个！");

        $content = array(
            'sender'=>$foo['sender'],
            'title'=>$foo['title'],
            'content'=>$foo['content'],
            'serverid'=>$foo['serverid'],
            'item'=>$item,
        );

        $data=array(
            'senderid'=>$_SESSION['uid'],
            'data'=>serialize($content),
            'logdate'=>date('Y-m-d H:i:s',time()),
            'status'=>0,
            'type'=>1,
            'limit_level'=>$foo['limit_level'],
        );
        $res = $this->MailModel->handle('insert',array('data'=>$data), 'mail');

        if($res){
            echo 'success';
        }else{
            echo 'fail';
        }
    }

    //审核邮件
    public function check(){
		$mailcmd = MSS_SYSREWARDMAIL;
		$date = date("Y-m-d H:i:s");
        //审批通过
        if($_POST['type'] == 1){
            $mailInfo = $this->MailModel->handle('getOne',array('where'=>"id = ".$_POST['id']), 'mail');
            $mailContent = unserialize($mailInfo['data']);
			
            switch($mailInfo['type']){
                case 0:
                case 2:
                    $serverid = $mailInfo['serverid'];

                    //获取服务器信息 连接单服数据库
                    $ser = (new ServerModel())->handle('getOne',array("where"=>"server_id={$serverid}"), 'server');
                    $mysql = Util::getMysqlCon($ser['mysql_host'],$ser['mysql_user'],$ser['mysql_passwd'],$ser['actor_table'],$ser['mysql_port']);

                    //角色ID、角色名或者账号名
                    $rolelist = explode(",", $mailContent['rolelist']);

                    if($mailContent['condition'] == 1){
                        //按角色ID
                        $roleids = $rolelist;

                    }else{
                        //按角色名或者账号名
                        foreach ($rolelist as $k => $v) {
                            $value[] = "'$v'";
                        }
                        $in = "(".implode(',', $value).")";

                        $cloum = $mailContent['condition'] ==2 ? "actorname" : "accountname";
                        $sql = "SELECT actorid FROM actors WHERE {$cloum} IN {$in}";
                        $query = $mysql->query($sql);
                        while($row = $query->fetch_assoc()){
                            $roleids[]=$row['actorid'];
                        }
                    }
					//exit(var_dump($roleids));
                    if( ! $roleids ) exit("角色或账号不存在");
					foreach($roleids as $roleid){
						if(!$roleid) continue;
						$title = $mailContent['title']?$mailContent['title']:'系统邮件';
						$content = $mailContent['content'];
						$cmdstr = "1"."|".$roleid."|".$title."|".$content."|";
						$itemstr = "";
						foreach($mailContent['item'] as $key=>$item){
							$bind = 0;
							$itemstr .= $item['type'].",".$item['sort'].",".$item['num'].",".$bind.";";
						}
						$cmdstr .= $itemstr;
						//GAMECMD
						$GAMECMD = Util::getMysqlCon(GAMECMDHOST,GAMECMDUSER,GAMECMDPASS,GAMECMDDBNAME,GAMECMDPORT);
						$sql = "INSERT INTO `command` (serverindex, operindex, strcom, nstate,username,logdate,reser1) VALUES ('{$serverid}','$mailcmd','{$cmdstr}','1','0','{$date}',1)";	
						//exit($sql);
						if(!$GAMECMD->query($sql)) exit("Fail to insert into gmcmd(role mail)");
						break;
					}
					break;
                case 1://全服邮件
                    $server = explode(",",$mailContent['serverid']);
                    $msg = '';
                    $data = $da = array();
                    foreach($server as $server_id){
                        $ser = (new ServerModel())->handle('getOne',array("where"=>"server_id={$server_id}"), 'server');
                        $mysql = Util::getMysqlCon($ser['mysql_host'],$ser['mysql_user'],$ser['mysql_passwd'],$ser['actor_table'],$ser['mysql_port']);
						$title = $mailContent['title']?$mailContent['title']:'系统邮件';
						$content = $mailContent['content']?$mailContent['content']:'系统奖励';
						$itemstr = "";
						$cmdstr = "2"."|".""."|".$title."|".$content."|";
                        if($mailContent['item']){
                            foreach($mailContent['item'] as $key=>$item){
								$bind = 0;
							    $itemstr .= $item['type'].",".$item['sort'].",".$item['num'].",".$bind.";";
                            }
                        }
						$cmdstr .= $itemstr;
						//GAMECMD
						$GAMECMD = Util::getMysqlCon(GAMECMDHOST,GAMECMDUSER,GAMECMDPASS,GAMECMDDBNAME,GAMECMDPORT);
						$sql = "INSERT INTO `command` (serverindex, operindex, strcom, nstate,username,logdate,reser1) VALUES ('{$server_id}','$mailcmd','{$cmdstr}','1','0','{$date}',1)";	
						if(!$GAMECMD->query($sql)){ 
							exit("Fail to insert into gmcmd(role mail)");
							break;
						}
                    }
                    break;
            }
        }

        //更改本地邮件状态
         $data = array(
            'checked_gm'=>$_SESSION['username'],
            'checked_time'=>date('Y-m-d H:i:s',time()),
            'status'=> $_POST['type'] == 0 ? 2 :1,
             'error'=>$msg?$msg:''
        );

        $res = $this->MailModel->handle('update',array('data'=>$data,'where'=>"id=".$_POST['id']), 'mail');
        if($res){
            $this->LogModel->logAdd("审核邮件，通过：{$_POST['id']}");
            exit("success");
        }else{
            $this->LogModel->logAdd("审核邮件，不通过：{$_POST['id']}");
            exit("fail");
        }
    }

    //邮件id随机产生
    function getMailID($sec=60000, $serverid=0){
        $sid = $serverid;
        if($serverid > 0){
            $sid = $serverid;
        }else{
            if(isset($_SESSION['server_id'])){
                $sid = intval($_SESSION['server_id']);
            }
        }
        $low = decbin(time());
        $middle = $this->zerofill(decbin($sec), 16);
        $high = $this->zerofill(decbin($sid), 16);
        $mailid = bindec($high . $middle . 0 . $low);
        return sprintf("%1.0f",$mailid);
    }
    function zeroFill($str, $len){
        $tmp = '';
        for ($i=0; $i<($len-strlen($str)); $i++){
            $tmp .= "0";
        }
        $newStr = $tmp . $str;
        return $newStr;
    }

    //获取距离 2010-01-01 00:00:00 的秒数
    function getMiniTime($n=''){
        $n || $n=time();
		$t = strtotime('2010-01-01 00:00:00');
		$minitime = $n - $t;
	    return $minitime;
	}

    function getItem(){
        $re = (new Model())->handle('getList',array("order"=>"item_id ASC"), 'items');
        echo json_encode($re);
    }
}
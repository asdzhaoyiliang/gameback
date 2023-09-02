<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class MailController
 * 邮件系统
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class MailController extends Controller
{

    function __construct()
    {
        parent::__construct();
        $this->LogModel = new LogModel();
        $this->MailModel = new MailModel();
    }

    public function index()
    {
        $tabs = array(
            array('title' => '发送邮件', 'url' => 'admin.php?ctrl=mail&act=send_mail'),
            array('title' => '全服邮件', 'url' => 'admin.php?ctrl=mail&act=server_mail'),
            array('title' => '发送记录', 'url' => 'admin.php?ctrl=mail&act=mail_list'),
        );
        //$this->themeTabs($tabs);
    }

    //个人邮件
    public function role_mail()
    {
        $tabs = array(
            array('title' => '发送邮件', 'url' => 'admin.php?ctrl=mail&act=add&type=mail'),
            array('title' => '发送记录', 'url' => 'admin.php?ctrl=mail&act=getlist&type=role_mail'),
        );
        $this->themeTabs($tabs);
    }

    //单服邮件
    public function server_mail()
    {
        $tabs = array(
            array('title' => '发送邮件', 'url' => 'admin.php?ctrl=mail&act=send_server_mail'),
            array('title' => '发送记录', 'url' => 'admin.php?ctrl=mail&act=getlist&type=server_mail'),
        );
        $this->themeTabs($tabs);
    }

    //资源管理
    public function resource()
    {
        $tabs = array(
            array('title' => '资源申请', 'url' => 'admin.php?ctrl=mail&act=add&type=resource'),
            array('title' => '申请记录', 'url' => 'admin.php?ctrl=mail&act=getlist&type=resource'),
        );
        $this->themeTabs($tabs);
    }

    //发送记录
    public function getlist()
    {
        $searchFields = [
            ['type' => 'server', 'title' => '服务器', 'value' => $this->serverList()],
            ['title' => '发送时间', 'type' => 'range_date'],
        ];

        $showFields = array(
            'a' => array('title' => 'ID', 'sortable' => true, 'width' => '40px'),
            'b' => array('title' => '服务器', 'sortable' => true, 'width' => '80px'),
            'c' => array('title' => '邮件内容'),
            'd' => array('title' => '原因'),
            'e' => array('title' => '收件人'),
            'f' => array('title' => '开始时间'),
            'g' => array('title' => '结束时间'),
            'h' => array('title' => '附件'),
            'i' => array('title' => '发送人', 'width' => '40px'),
            'j' => array('title' => '发送时间', 'sortable' => true, 'width' => '60px'),
            'k' => array('title' => '审核者', 'width' => '60px'),
            'l' => array('title' => '状态', 'sortable' => true, 'width' => '60px'),
            'm' => array('title' => '操作'),
        );

//        switch($this->getParam('type')){
//            case 'role_mail':
//                $showFields['d'] = array('title' => '角色/账号');
//                break;
//            case 'server_mail':
//                $showFields['d'] = array('title' => '赠送条件');
//                break;
//            case 'resource':
//                $showFields['d'] = array('title' => '角色/账号');
//
//                break;
//        }

        ksort($showFields);
        $ajaxSource = "admin.php?ctrl=mail&act=mail_list_data&type=" . $this->getParam('type');
        $js = <<<ECO
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
        $otherData['js'] = $js;
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData, true);
    }

    public function mail_list_data()
    {
        switch ($this->getParam('type')) {
            case 'role_mail':
                $orderF = array(0 => 'id', 1 => 'serverid', 2 => 'type', 6 => 'logdate', 8 => 'status');
                break;
            case 'server_mail':
                $orderF = array(0 => 'id', 1 => 'serverid', 2 => 'type', 6 => 'logdate', 8 => 'status');
                break;
            case 'resource':
                $orderF = array(0 => 'id', 1 => 'serverid', 5 => 'logdate', 6 > 'status');
                break;
        }
        $condition = array('ServerIsNotNeed' => true);
        echo $this->MailModel->getData(
            $this->_DataTablesCondition($_GET, $orderF, '*', $condition),
            $this->getParam('type'));
    }

    //增加邮件、资源申请
    public function add()
    {
        $this->smarty->assign('moneyType', CDict::$moneyType);
        $this->smarty->assign('type', $this->getParam('type'));
//        $this->smarty->assign('server', $this->serverList());
        $this->smarty->assign('server', $this->multiSelectServer());
        $this->smarty->display('mail/add.tpl');
    }

    //全服邮件
    public function send_server_mail()
    {
        $this->smarty->assign('moneyType', CDict::$moneyType);
        $this->smarty->assign('server', $this->multiSelectServer());
        $this->smarty->display('mail/server_mail.tpl');
    }

    public function add_submit()
    {
        $foo = $_POST['data'];
        $item_str = "";
        if ($foo['item']) {
            foreach ($foo['item'] as $val) {

                $item_name = explode("|", $val[0]);
                $item[] = array('type' => $item_name[0], 'id' => $item_name[1], 'num' => $val[1]);
                $item_str .= "{$item_name[2]} x {$val[1]}；";
            }
        }
        count($item) > 5 && exit("金钱和道具的总数不能超过5个！");
        if ($foo['type'] == 'language') {
            $tmp['type'] = 0;
            $tmp['senderid'] = $_SESSION['uid'];
            $log_desc = '发送个人邮件';
        } else {
            $tmp['type'] = 1;
            $tmp['senderid'] = $_SESSION['uid'];
            $log_desc = '发送全服邮件';
        }


        $content = array(
            'mail_id' => $foo['mail_id'],
            'condition' => $foo['condition'],
            'rolelist' => $foo['rolelist'],
            'title' => $foo['title'],
            'reason' => $foo['reason'],
            'content' => $foo['content'],
            'start_time' => $foo['start_time'],
            'end_time' => $foo['end_time'],
            'serverid' => $foo['serverid'],
            'limit_role_guids' => $foo['limit_role_guids'],
            'item' => $item,
        );

        $data = array(
            'data' => json_encode($content),
            'logdate' => date('Y-m-d H:i:s', time()),
            'status' => 0,
            'serverid' => $foo['serverid'],
            'item' => $item_str
        );
        $data = array_merge($data, $tmp);
        $res = $this->MailModel->handle('insert', array('data' => $data), 'mail');

        if ($res) {
            echo 'success';
            $log_desc .= " 成功";
        } else {
            echo 'fail';
            $log_desc .= " 失败";
        }
        $this->LogModel->logAdd($log_desc);
    }

    public function server_mail_submit()
    {
        $foo = $_POST['data'];

        $foo['yuanbao'] && $item[] = array('type' => 10, 'sort' => 0, 'num' => $foo['yuanbao']);
        $foo['gold'] && $item[] = array('type' => 5, 'sort' => 0, 'num' => $foo['gold']);
        exit("sssss");
        if ($foo['item']) {
            foreach ($foo['item'] as $val) {
                $item[] = array('type' => 1, 'sort' => $val[0], 'num' => $val[1], 'bind' => $val[2]);
            }
        }

        if (count($item) > 4) exit("金钱和道具的总数不能超过4个！");

        $content = array(
            'sender' => $foo['sender'],
            'title' => $foo['title'],
            'content' => $foo['content'],
            'serverid' => $foo['serverid'],
            'item' => $item,
        );

        $data = array(
            'senderid' => $_SESSION['uid'],
            'data' => json_encode($content),
            'logdate' => date('Y-m-d H:i:s', time()),
            'status' => 0,
            'type' => 1,
            'limit_level' => $foo['limit_level'],
        );
        $res = $this->MailModel->handle('insert', array('data' => $data), 'mail');

        if ($res) {
            echo 'success';
        } else {
            echo 'fail';
        }
    }

    //审核邮件
    public function check()
    {
        $mailcmd = MSS_SYSREWARDMAIL;
        $date = date("Y-m-d H:i:s");
        //审批通过
        if ($_POST['type'] == 1) {
            $mailInfo = $this->MailModel->handle('getOne', array('where' => "id = " . $_POST['id']), 'mail');
            $mailContent = json_decode($mailInfo['data'], true);


            $server = explode(",", $mailContent['serverid']);
            $msg = '';
            $data = $da = array();
            foreach ($server as $server_id) {
                $ser = (new ServerModel())->handle('getOne', array("where" => "server_id={$server_id}"), 'server');
                $mysql = Util::getMysqlCon($ser['mysql_host'], $ser['mysql_user'], $ser['mysql_passwd'], $ser['actor_table'], $ser['mysql_port']);
                $title = $mailContent['title'] ? $mailContent['title'] : '系统邮件';
                $content = $mailContent['content'] ? $mailContent['content'] : '系统奖励';
                $itemstr = "";
                $cmdstr = "2" . "|" . "" . "|" . $title . "|" . $content . "|";
                if ($mailContent['item']) {
                    foreach ($mailContent['item'] as $key => $item) {
                        $bind = 0;
                        $itemstr .= $item['type'] . "," . $item['sort'] . "," . $item['num'] . "," . $bind . ";";
                    }
                }
                $cmdstr .= $itemstr;
                //GAMECMD
                $start_time = $mailContent['start_time'] == "" ? 0 : strtotime($mailContent['start_time']);
                $end_time = $mailContent['end_time'] == "" ? 0 : strtotime($mailContent['end_time']);
                $reward = [];
                foreach ($mailContent['item'] as $v) {
                    $reward[] = $v['type'] . ":" . $v['id'] . ":" . $v['num'];
                }
                $rewardStr = implode('|', $reward);
                Util::requestGameForMail($ser['server_ip'], $ser['server_port'], $ser['group_id'], $ser['server_id'], $mailContent['mail_id'], $rewardStr, $mailContent['content'], $mailContent['limit_role_guids'], $start_time, $end_time);
            }

            //更改本地邮件状态
            $data = array(
                'checked_gm' => $_SESSION['username'],
                'checked_time' => date('Y-m-d H:i:s', time()),
                'status' => $_POST['type'] == 0 ? 2 : 1,
                'error' => $msg ? $msg : ''
            );

            $res = $this->MailModel->handle('update', array('data' => $data, 'where' => "id=" . $_POST['id']), 'mail');
            if ($res) {
                $this->LogModel->logAdd("审核邮件，通过：{$_POST['id']}");
                exit("success");
            } else {
                $this->LogModel->logAdd("审核邮件，不通过：{$_POST['id']}");
                exit("fail");
            }
        }
    }

    //邮件id随机产生
    function getMailID($sec = 60000, $serverid = 0)
    {
        $sid = $serverid;
        if ($serverid > 0) {
            $sid = $serverid;
        } else {
            if (isset($_SESSION['server_id'])) {
                $sid = intval($_SESSION['server_id']);
            }
        }
        $low = decbin(time());
        $middle = $this->zerofill(decbin($sec), 16);
        $high = $this->zerofill(decbin($sid), 16);
        $mailid = bindec($high . $middle . 0 . $low);
        return sprintf("%1.0f", $mailid);
    }

    function zeroFill($str, $len)
    {
        $tmp = '';
        for ($i = 0; $i < ($len - strlen($str)); $i++) {
            $tmp .= "0";
        }
        $newStr = $tmp . $str;
        return $newStr;
    }

    //获取距离 2010-01-01 00:00:00 的秒数
    function getMiniTime($n = '')
    {
        $n || $n = time();
        $t = strtotime('2010-01-01 00:00:00');
        $minitime = $n - $t;
        return $minitime;
    }

    function getItem()
    {
        $re = (new Model())->handle('getList', array("order" => "id ASC"), 'items');
        echo json_encode($re);
    }
}
<?php
	/*
	-- plat_id			 渠道id
	-- device_id		 设备id
	-- user_id			 用户uid
	-- server_id		 区服id
	-- role_id			 角色id
	-- role_name    	 角色名
	-- role_level       角色等级
	-- role_gold		 角色元宝
	-- chat_type        聊天类型
	-- chat_msg         聊天信息
	-- chat_role        私聊对象（角色id）
	-- role_vip         角色VIP
	-- chat_role_name   私聊对象（角色名）
	-- chat_role_level  私聊对象（角色等级）
	*/
class ChatController extends Controller {

    function __construct(){
        parent::__construct();
    }

    public function index() {
        $tabs = array(
            array('title' => "聊天列表", 'url' => "admin.php?ctrl=chat&act=dataTablesRequest"),
        );
        $this->themeTabs($tabs);
    }

    //玩家列表
    public function dataTablesRequest() {
        $type = array('角色名', '角色ID', '账号','消息');
        $searchFields = array(
            array('type' => 'server', 'value' => $this->serverList(false)),
            array('title' => '', 'type' => 'select', 'value' => $type),
            array('title' => ''),
        );
        $showFields = array(
			'server_id' => array('title' => '服务器ID'),
            'role_id' => array('title' => '角色ID'),
            'role_name' => array('title' => '角色名'),
            'user_id' => array('title' => '账户'),
            'role_level' => array('title' => '等级'),
            'chat_msg' => array('title' => '内容'),
            'dt' => array('title' => '时间'),
			'handle' => array('title' => '操作')
        );
        $ajaxSource = "admin.php?ctrl=chat&act=dataTablesRespond";

        $banDialog = $this->smarty->fetch('role/ban_dialog.tpl');
        $otherData['header'] = "<div id='ban_dialog' style='display: none'>$banDialog</div>";

        $otherData['js'] = <<< END
            function goto(id) {
                $('#tabs').tabs("url", 1, "admin.php?ctrl=role&act=show&type=baseinfo&role_id=" + id)
                $('#tabs').tabs("url", 2, "admin.php?ctrl=role&act=show&type=equip&role_id=" + id)
                $('#tabs').tabs("url", 3, 'admin.php?ctrl=role&act=show&type=skill&role_id=' + id)
                $('#tabs').tabs("url", 4, 'admin.php?ctrl=role&act=show&type=package&role_id=' + id),
                $('#tabs').tabs("url", 5, 'admin.php?ctrl=role&act=show&type=pet&role_id=' + id),
                $('#tabs').tabs("url", 6, 'admin.php?ctrl=role&act=show&type=economy&role_id=' + id),
                $('#tabs').tabs('select', 1)
            }

            function action(serverid,type,id){
                switch(type){
                    case 'kick': //踢玩家下线
					case 'restore': //恢复账号
                    case 'releaseshutup'://解除禁言
                        if(confirm("确定操作吗？")){
                            $.post("admin.php?ctrl=chat&act=ban",{serverid:serverid,type:type,id:id},function(msg){
                                alert(msg)
                            })
                        }
                        break;

                    case 'shutup'://禁言
                        var time = prompt("请输入禁用时限(以分为单位)");
                        if(time){
                            $.post("admin.php?ctrl=chat&act=ban",{serverid:serverid,type:type,id:id,time:time},function(msg){
                                alert(msg)
                            })
                        }
                        break;
	
                    case 'zyzy'://自言自语
                        var time = prompt("请输入0或1，0表示解禁，1表示启动");
                        if(time){
                            $.post("admin.php?ctrl=chat&act=ban",{serverid:serverid,type:type,id:id,time:time},function(msg){
                                alert(msg)
                            })
                        }
                        break;
					case 'user_id':
					case 'device': //封设备
                    case 'ip'://封IP
                        if(serverid){
                            $.post("admin.php?ctrl=chat&act=ban",{serverid:serverid,type:type,id:id,time:time},function(msg){
                                alert(msg)
                            })
                        }
                        break;
                    case 'forbidchat'://禁聊天
                    case 'forbidmail'://禁发邮件
                        var time = prompt("请输入禁用时限(以秒为单位)");
                        if(time){
                            $.post("admin.php?ctrl=chat&act=ban",{serverid:serverid,type:type,id:id,time:time},function(msg){
                                alert(msg)
                            })
                        }
                        break;
                }
            }
END;
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData, true);
    }
    public function dataTablesRespond() {
        $json_arr = array(
            'sEcho'                => intval($_GET['sEcho']),
            'iTotalRecords'        => 0,
            "iTotalDisplayRecords" => 0,
            'aaData'               => array()
        );

        $server_id= $_GET['sSearch_0'];
        $this->validateServer($server_id);
        if(trim($_GET['sSearch_2'])){
            switch($_GET['sSearch_1']){
                case 0:
                    $where = "role_name like  '%".$_GET['sSearch_2']."%'";
                    break;
                case 1:
                    $where = "role_id like '%".$_GET['sSearch_2']."%'";
                    break;
                case 2:
                    $where = "user_id like '%".$_GET['sSearch_2']."%'";
                    break;
                case 3:
                    $where = "chat_msg  like '%".$_GET['sSearch_2']."%'";
                    break;
            }
        }
        $order = "id ".$_GET['sSortDir_0'];
        $limit = intval($_GET['iDisplayStart']).",".intval($_GET['iDisplayLength']);
        $fields = "*";


        $sql = "SELECT {$fields} FROM `bg_chatlog`";
        $where && $sql .= " WHERE $where";
        $order && $sql .= " ORDER BY $order";
        $limit && $sql .= " LIMIT $limit";

        $mysql = Util::getMysqlCon(MYSQLHOST, MYSQLUSER, MYSQLPASS, DB_NAME,MYSQLPORT);
        $query = $mysql->query($sql);
        while($row = $query->fetch_assoc()){
            $handle = "";
            $handle .= '<a onclick="action('.$row['server_id'].',\'shutup\','.$row['role_id'].')" style="color:red;text-decoration: underline;cursor:pointer">禁言 </a>&nbsp;';
			$handle .= '<a onclick="action('.$row['server_id'].',\'kick\','.$row['role_id'].')" style="color:red;text-decoration: underline;cursor:pointer">封角色</a>&nbsp;';
			//$handle .= '<a onclick="action('.$row['server_id'].',\'user_id\',\''.$row['user_id'].'\')" style="color:red;text-decoration: underline;cursor:pointer">封账号</a>&nbsp;';
			//$handle .= '<a onclick="action('.$row['server_id'].',\'ip\',\''.$row['ip'].'\')" style="color:red;text-decoration: underline;cursor:pointer">封IP</a><br/>';
			//$handle .= '<a onclick="action('.$row['server_id'].',\'device\',\''.$row['device'].'\')" style="color:red;text-decoration: underline;cursor:pointer">封设备</a><br/>';
            $aaData[]=array(
				$row['server_id'],
                $row['role_id'],
                $row['role_name'],
                $row['user_id'],
				$row['role_level'],
                $row['chat_msg'],
                $row['dt'],
                $handle,
            );
        }

			
        $sql = "SELECT COUNT(*) AS count_data FROM  `bg_chatlog`";
        $query = $mysql->query($sql);
        $row = $query->fetch_assoc();
        $iTotalRecords = $row['count_data'];

        $sql = "SELECT COUNT(*) AS count_data FROM `bg_chatlog`";
        $where && $sql .= " WHERE $where";
        $query = $mysql->query($sql);
        $row = $query->fetch_assoc();
        $iTotalDisplayRecords= $row['count_data'];

        $mysql->close();

        $json_arr = array(
            'sEcho'                => intval($_GET['sEcho']),
            'iTotalRecords'        => $iTotalRecords,
            "iTotalDisplayRecords" => $iTotalDisplayRecords,
            'aaData'               => $aaData ? $aaData : array()
        );
        echo json_encode($json_arr);
    }



    public function ban(){
		$serverid = $_POST['serverid'];
        $param1 = $_POST['type'];
        $param2 = $_POST['id'];
        $param3 = isset($_POST['time']) ? $_POST['time'] : '';
		$date = date("Y-m-d H:i:s");
		$cmdid = 0;
		$strcom = '';
		if($param1 == 'user_id'){
			$mysql = Util::getMysqlCon(MYSQLHOST, MYSQLUSER, MYSQLPASS, DB_NAME,MYSQLPORT);
			$sql =  "insert into bg_forbid(user_id) values('{$param2}') ";
			$query = $mysql->query($sql);
			exit('success');
		}elseif ($param1 == 'ip'){
			$mysql = Util::getMysqlCon(MYSQLHOST, MYSQLUSER, MYSQLPASS, DB_NAME,MYSQLPORT);
			$sql = " insert into bg_forbid(ip) values('{$param2}') ";
			$query = $mysql->query($sql);
			exit('success');	
		}elseif ($param1 == 'device'){
			$mysql = Util::getMysqlCon(MYSQLHOST, MYSQLUSER, MYSQLPASS, DB_NAME,MYSQLPORT);
			$sql = " insert into bg_forbid(device) values('{$param2}') ";
			$query = $mysql->query($sql);
			exit('success');
		}elseif($param1 == "shutup"){
			$cmdid = MSS_SHUTUP_BYID;
			$t = time() + $param3 * 60;
			$strcom = $param2."|".$t;
		}elseif ($param1 == "releaseshutup"){
			$cmdid = 10088;
		}elseif($param1 == "kick"){
			$cmdid = MSS_KICKPLAY;
			$strcom = $param2;
		}elseif($param1 == "restore"){
			$cmdid = 10089;
			$strcom = $param2;
		}
        $data = array(
            'serverindex' => $serverid,
            'operindex' => $cmdid,
			'strcom' => $strcom,
            'nstate' => '1',
            'username' => '',
            'logdate' => $date,
            'reser1' => '1',
        );
        if(Util::sync('command', $serverid, $data)){
            echo 'success';
        }else{
            echo 'fail';
        }
    }
}

						
/* End of file ChatController.class.php */
/* Location: ./controller/ChatController.class.php  */
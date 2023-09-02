<?php
/**
 * Class RoleController
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */
class RoleController extends Controller {

    function __construct(){
        parent::__construct();
    }

    public function index() {
        $tabs = array(
            array('title' => "玩家列表", 'url' => "admin.php?ctrl=role&act=dataTablesRequest"),
            array('title' => '基本信息', 'url' => 'admin.php?ctrl=role&act=show'),
//            array('title' => '装备', 'url' => 'admin.php?ctrl=role&act=show'),
//            array('title' => '技能', 'url' => 'admin.php?ctrl=role&act=show'),
//            array('title' => '背包物品', 'url' => 'admin.php?ctrl=role&act=show'),
            //array('title' => '宠物', 'url' => 'admin.php?ctrl=role&act=show'),
//            array('title' => '经济统计', 'url' => 'admin.php?ctrl=role&act=show'),
        );
        $this->themeTabs($tabs);
    }

    //玩家列表
    public function dataTablesRequest() {
        $type = array('角色ID');
        $searchFields = array(
            array('type' => 'server', 'value' => $this->serverList(false)),
            array('title' => '', 'type' => 'select', 'value' => $type),
            array('title' => ''),
        );

        $showFields = array(
            'id' => array('title' => '角色ID', 'width' => '130px', 'sortable' => true),
            'name' => array('title' => '角色名'),
            'userid' => array('title' => '账号id'),
            'serverid' => array('title' => '服务器id'),
            'sex' => array('title' => '性别'),
            'online' => array('title' => '在线状态'),
            'registertime' => array('title' => '注册时间'),
            'lastlogin' => array('title' => '最后登录时间'),
            'handle' => array('title' => '操作')
        );
        $ajaxSource = "admin.php?ctrl=role&act=dataTablesRespond";

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

            function action(type,id,serverid){
                switch(type){
                    case 'kick': //踢玩家下线
					case 'restore': //恢复账号
                    case 'releaseshutup'://解除禁言
                        if(confirm("确定操作吗？")){
                            $.post("admin.php?ctrl=role&act=ban",{type:type,id:id,serverid:serverid},function(msg){
                                alert(msg)
                            })
                        }
                        break;

                    case 'shutup'://禁言
                        var time = prompt("请输入禁用时限(以分为单位)");
                        if(time){
                            $.post("admin.php?ctrl=role&act=ban",{type:type,id:id,time:time},function(msg){
                                alert(msg)
                            })
                        }
                        break;
	
                    case 'zyzy'://自言自语
                        var time = prompt("请输入0或1，0表示解禁，1表示启动");
                        if(time){
                            $.post("admin.php?ctrl=role&act=ban",{type:type,id:id,time:time},function(msg){
                                alert(msg)
                            })
                        }
                        break;

                    case 'forbidchat'://禁聊天
                    case 'forbidmail'://禁发邮件
                        var time = prompt("请输入禁用时限(以秒为单位)");
                        if(time){
                            $.post("admin.php?ctrl=role&act=ban",{type:type,id:id,time:time},function(msg){
                                alert(msg)
                            })
                        }
                        break;
                }
            }
END;
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData, true);
    }
    public function dataTablesRespond()
    {
        $json_arr = array(
            'sEcho' => intval($_GET['sEcho']),
            'iTotalRecords' => 0,
            "iTotalDisplayRecords" => 0,
            'aaData' => array()
        );

        $server_id = $_GET['sSearch_0'];
        $this->validateServer($server_id);

        $ser = (new ServerModel())->getOneById($server_id);
        if (!$ser) exit(json_encode($json_arr));

        $aaData = array();
        if ($_GET["sSearch_2"] != "") {
            $data = Util::requestGameForUser($ser['server_ip'], $ser['server_port'], $ser['group_id'], $ser['server_id'], $_GET["sSearch_2"]);
            if ($data != "") {
//                $data = preg_replace('/"RoleGuid":(\d{1,})./', '"RoleGuid":"\\1",', $data);
//                $data = preg_replace('/"UserId":(\d{1,})./', '"UserId":"\\1",', $data);

                $role = json_decode($data, true);

                $handle = "";
                $handle .= '<a onclick="action(\'shutup\',' . $role['RoleGuid'] . ')" style="color:red;text-decoration: underline;cursor:pointer">禁言 </a>&nbsp;';
                $handle .= '<a onclick="action(\'releaseshutup\',' . $role['RoleGuid'] . ')" style="color:red;text-decoration: underline;cursor:pointer">解禁</a><br/>';
                $handle .= '<a onclick="action(\'kick\',' . $role['RoleGuid'] . ',' . $ser['server_id'] . ')" style="color:red;text-decoration: underline;cursor:pointer">踢号</a>&nbsp;';
//            $handle .= '<a onclick="action(\'restore\','.$role['RoleGuid'].')" style="color:red;text-decoration: underline;cursor:pointer">恢复</a>&nbsp;';
                //$handle .= '<a onclick="action(\'forbidchat\',\''.$row['actorname'].'\')" style="color:red;text-decoration: underline;cursor:pointer">禁聊天 </a>&nbsp;';
                //$handle .= '<a onclick="action(\'zyzy\',\''.$row['actorname'].'\')" style="color:red;text-decoration: underline;cursor:pointer">自言自语 </a><br/>';
                //$handle .= '<a onclick="action(\'forbidmail\',\''.$row['actorname'].'\')" style="color:red;text-decoration: underline;cursor:pointer">禁发邮件</a>';

                $roleGuid = $role["RoleGuid"]."";
                $aaData[] = array(
                    $role["RoleGuid"],
                    "<span style='cursor: pointer; border-bottom: 1px dashed blue' onclick=\"goto('{$roleGuid}')\">{$role['Name']}</span>",
                    $role["UserId"],
                    $ser['server_id'],
                    $role['Sex'] == 1 ? "男" : "女",
                    $role['IsOnline'] ? "在线" : "离线",
                    date("Y-m-d H:i:s", $role['RegisterTime']),
                    date("Y-m-d H:i:s", $role['LastTime']),
                    $handle
                );
            }
        }
        $json_arr = array(
            'sEcho' => intval($_GET['sEcho']),
            'iTotalRecords' => 0,
            "iTotalDisplayRecords" => 0,
            'aaData' => $aaData?:array()
        );
        echo json_encode($json_arr);
    }

    public function show(){
        $role_id = $this->getParam('role_id');
        if (!$role_id) exit('请点击角色名来选定角色');


        $server_id = $_SESSION['server_id'];
        $this->validateServer($server_id);

        $ser = (new ServerModel())->getOneById($server_id);

        $type = $this->getParam('type');
        switch($type){
            case 'baseinfo':
                $data = Util::requestGameForUser($ser['server_ip'], $ser['server_port'], $ser['group_id'], $ser['server_id'], $role_id,1);
                if ($data != "") {
                    $content = json_decode($data, true);
                }
//                $content = Util::get_single_data_byMysql('actor','actors',$server_id,$fields,$where,'getOne');
            $content["Register"] = date("Y-m-d H:i:s",$content["RegisterTime"]);
            $content["LastLogin"] = date("Y-m-d H:i:s",$content["LastTime"]);

                break;

//            case 'equip':
//                $content = Util::get_single_data_byMysql('actor','actorequipitem',$server_id,$fields,$where);
//                $items = Util::itemsToArray();
//                if($content){
//                    foreach($content as $key=>$row){
//                        $itemId = $row['itemidquastrong']&65535;
//                        $content[$key]['itemId'] = $itemId;
//                        $content[$key]['itemName'] = $items[$itemId];
//                        $content[$key]['qualityLevel'] = ($row['itemidquastrong']>>16)&255;
//                        $content[$key]['strongLevel'] = ($row['itemidquastrong']>>24)&255;
//                        $content[$key]['itemCount'] = $row['itemcountflag']&255;//($row['itemcountflag']>>16)&65535;
//                    }
//                }
//                break;
//
//            case 'skill':
//                $content = Util::get_single_data_byMysql('actor','skill',$server_id,$fields,$where);
//                foreach($content as $k=>$row){
//                    $content[$k]['skillId'] =  $row['skillidlvmj']&65535;
//                    $content[$k]['skillLevel'] =  ($row['skillidlvmj']>>16)&255;
//                }
//                break;
//
//            case 'package':
//                $fields = "itemguid,itemidquastrong,itemidquastrong,itemidquastrong,itemcountflag,itemtime,itemduration";
//                $content = Util::get_single_data_byMysql('actor','actorbagitem',$server_id,$fields,$where);
//                $items = Util::itemsToArray();
//                if($content){
//                    foreach($content as $key=>$row){
//                        $itemId = $row['itemidquastrong']&65535;
//                        $content[$key]['itemId'] =$itemId ;
//                        $content[$key]['itemName'] = $items[$itemId];
//                        $content[$key]['qualityLevel'] = ($row['itemidquastrong']>>16)&255;
//                        $content[$key]['strongLevel'] = ($row['itemidquastrong']>>24)&255;
//                        $content[$key]['itemCount'] = $row['itemcountflag']&255;//($row['itemcountflag']>>16)&65535;
//                    }
//                }
//                break;
//
//            case 'pet':
//                $content = Util::get_single_data_byMysql('actor','pet',$server_id,$fields,$where);
//                break;
//
//            case 'economy':
//                $where .=" AND serverid=$server_id";
//                $where .=" ORDER BY logdate DESC";
//                //$where .=" LIMIT 0,10";
//                //$field = "logdate,currency,kingdom,amount";
//                $res= (new Model())->handle('getList',array('where'=>$where), 'economy');
//                if($res){
//                    $currency=array('yb'=>'元宝','xb'=>'铜钱','yl'=>'银两','by'=>'绑定元宝');
//                    $kingdom=array('earning'=>'+','expenditure'=>'-');
//                    foreach($res as $val){
//                        $con = json_decode($val['content'], true);
//                        foreach($con as $v){
//                            $content[]=array(
//                                'logdate'=>$val['logdate'],
//                                'currency'=>$currency[$v['currency']],
//                                'kingdom'=>$kingdom[$v['kingdom']],
//                                'amount'=>$v['amount'],
//                            );
//                        }
//
//                    }
//                }
//                break;
        }

        $this->smarty->assign('content',$content);
        $this->smarty->display("role/{$type}.tpl");
    }

    public function ban(){
        $param1 = $_POST['type'];
        $param2 = $_POST['id'];
        $server_id = $_POST['serverid'];
        $param3 = isset($_POST['time']) ? $_POST['time'] : '';
		$date = date("Y-m-d H:i:s");
		$cmdid = 0;
		$strcom = '';
		if($param1 == "shutup"){
			$cmdid = MSS_SHUTUP_BYID;
			$t = time() + $param3 * 60;
			$strcom = $param2."|".$t;
            //exit($strcom);
		}elseif ($param1 == "releaseshutup"){
			$cmdid = MSS_RELEASESHUTUP_BYID;
		}elseif($param1 == "kick"){

            //发送请求给目标服务器
            $ser = (new ServerModel())->getOneById($server_id);
			$res = Util::requestGameForKick($ser['server_ip'], $ser['server_port'], $ser['group_id'], $ser['server_id'],$param2);
            $result = json_decode($res,true);
            if ($result['StateDescription'] == "OK")
            {
                exit ('success');
            }
		}elseif($param1 == "restore"){
			$cmdid = MSS_REGAIN_ACTOR;
			$strcom = $param2;
		}
        $data = array(
            'serverindex' => $_SESSION['server_id'],
            'operindex' => $cmdid,
			'strcom' => $strcom,
            'nstate' => '1',
            'username' => '',
            'logdate' => $date,
            'reser1' => '1',
        );
        

        if(Util::sync('command', $_SESSION['server_id'], $data)){
            echo 'success';
        }else{
            echo 'fail';
        }
    }
}

						
/* End of file RoleController.class.php */
/* Location: ./controller/RoleController.class.php  */
<?php  defined('IN_WEB') ||  exit('Access Denied');
/**
 * Class InsiderController
 * 内部号管理
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class InsiderController extends Controller {

    public function __construct() {
        parent::__construct();
        $this->LogModel = new LogModel();
        $this->Model = new Model();
    }

    // --------------------------------------------------------------------

    public function index() {
        $tabs = array(
            array('title' => '增加内部号', 'url' => 'admin.php?ctrl=insider&act=add'),
            array('title' => '查看内部号', 'url' => 'admin.php?ctrl=insider&act=dataTablesRequest'),
        );
        $this->themeTabs($tabs);
    }

    // --------------------------------------------------------------------

    //增加内部号
    public function add(){
        $this->smarty->assign('server', $this->serverList(false));
        $this->smarty->display("insider/add.tpl");
    }

    // --------------------------------------------------------------------

    //查看内部号
    public function dataTablesRequest(){
        $searchFields = [];
        $showFields = [
            ['title' => '服务器'],
            ['title' => '角色名'],
            ['title' => '角色ID'],
            ['title' => '账号'],
            ['title' => 'GM等级'],
            ['title' => '姓名'],
            ['title' => '说明'],
            ['title' => '操作'],
        ];
        $ajaxSource = "admin.php?ctrl=insider&act=dataTablesRespond";
        $js = <<< END
        function del(id, serverid, account){
            if(confirm("确定删除吗？")){
                $.post("admin.php?ctrl=insider&actsubmit&type=del",{id:id, serverid:serverid, account:account},function(msg){
                   if(msg == 'success')
                      $("#tabs").tabs().tabs("load",1);
                })
            }
        }
END;
        $otherData = ['js' => $js];
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function dataTablesRespond(){

        $condition = array(
            'sEcho' => $_GET['sEcho'],
            'limit' => "{$_GET['iDisplayStart']},{$_GET['iDisplayLength']}"
        );

        $res = $this->Model->handle('getList',$condition, 'insider');
        if($res) {
            foreach($res as $val){
                $foo = $val['id'] . "," . $val['serverid'] .",\"". $val['account'] ."\"";
                $aaData[]=array(
                    $val['serverid'],
                    $val['role_name'],
                    $val['role_id'],
                    $val['account'],
                    $val['gm_level'],
                    $val['real_name'],
                    $val['position'],
                    "<button onclick='del({$foo})' class='datatable_search_button gbutton'  href='javascript:void(0)'>删除</button>"
                );
            }
        }
        echo $this->Model->returnJsonData($condition, $aaData?$aaData:array());

    }

    // --------------------------------------------------------------------

    public function submit(){
        switch( $_REQUEST['type'] ){
            case 'del':
                $data = $_POST;
                $server = (new ServerModel())->handle('getOne',array("where"=>"server_id=".$data['serverid']));
                $mysql = Util::getMysqlCon($server['mysql_host'],$server['mysql_user'],$server['mysql_passwd'],$server['actor_table'],$server['mysql_port']);
                $sql = "UPDATE globaluser SET gmlevel = 0 WHERE account = '" . $data['account'] ."'";

                if ( $mysql->query($sql) ){
                    $this->Model->handle('delete',array('where'=>'id='.$data['id']), 'insider');
                    $this->LogModel->logAdd("删除内部号:{$data['id']}");
                    echo 'success';
                }
                break;
            case 'add':
                $data = $_POST['data'];

                $server = (new ServerModel())->handle('getOne',array("where"=>"server_id=".$data['serverid']));
                if(!$server) exit("invalid serverid");

                $mysql = Util::getMysqlCon($server['mysql_host'],$server['mysql_user'],$server['mysql_passwd'],$server['actor_table'],$server['mysql_port']);
                if(!$mysql) exit("invalid mysql");


                switch($data['item_type']){
                    case 1:
                        $sql = "UPDATE globaluser SET gmlevel=" . $data['gm_level'] . " WHERE account = '" . $data['item_value'] ."'";
                        if( ! $mysql->query($sql) ) exit("invalid account");

                        $sql = "SELECT actorid AS role_id, actorname AS role_name FROM actors WHERE accountname = '" . $data['item_value'] ."'";
                        $value = $mysql->query($sql)->fetch_assoc();
                        $value['account'] = $data['item_value'];
                        break;
                    case 2:
                        $sql = "UPDATE globaluser SET gmlevel=" . $data['gm_level'] . " WHERE account =";
                        $sql .= "(SELECT accountname FROM actors WHERE actorname = '". $data['item_value'] ."' AND ";
                        $sql .= "serverindex = " . $data['serverid'] .")";
                        if( ! $mysql->query($sql) ) exit("invalid actorname");

                        $sql = "SELECT actorid AS role_id, accountname AS account FROM actors WHERE actorname = '". $data['item_value'] . "'";
                        $value = $mysql->query($sql)->fetch_assoc();
                        $value['role_name'] = $data['item_value'];
                        break;
                    case 3:
                        $sql = "UPDATE globaluser SET gmlevel=" . $data['gm_level'] . " WHERE account = ";
                        $sql .= "(SELECT accountname FROM actors WHERE actorid = ". $data['item_value'] .")";
                        if( ! $mysql->query($sql) ) exit("invalid actorname");

                        $sql = "SELECT actorname AS role_name, accountname AS account FROM actors WHERE actorid = ". $data['item_value'];
                        $value = $mysql->query($sql)->fetch_assoc();
                        $value['role_id'] = $data['item_value'];
                        break;
                }

                $value['serverid'] = $data['serverid'];
                $value['gm_level'] = $data['gm_level'];
                $data['real_name'] && $value['real_name'] = $data['real_name'];
                $data['position']  && $value['position'] = $data['position'];
                $this->Model->handle('replace', array('data'=>$value), 'insider');

                exit("success");
                break;

        }
    }

}
/* End of file InsiderController.class.php */
/* Location: ./controller/InsiderController.class.php  */

<?php defined('IN_WEB') ||  exit('Access Denied');
/**
 * Class ServerController
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */


class ServerController extends Controller{

    function __construct(){
        parent::__construct();
        $this->ServerModel = new ServerModel();
    }

    // --------------------------------------------------------------------

    public function index(){
        $tabs = array(
            array('title' => '服务器列表', 'url' => 'admin.php?ctrl=server&act=dataTablesRequest'),
            array('title' => '添加服务器', 'url' => 'admin.php?ctrl=server&act=edit'),
        );
        $this->themeTabs($tabs);
    }

    // --------------------------------------------------------------------

    /**
     * 服务器列表
     */
    public function dataTablesRequest(){
        $searchFields = [
            ['title'=>'服务器名称', 'type'=>'input'],
            ['title'=>'渠道标识', 'type'=>'input'],
        ];
        $showFields = [
            ['title' => '服务器ID','sortable'=>true,'width' => '65px;'],
            ['title' => '名称','sortable'=>true,'width' => '150px;'],
            ['title' => '渠道','sortable'=>true],
            ['title' => '服务器IP'],
            ['title' => '服务器端口'],
            ['title' => '游戏版本'],
            ['title' => '状态'],
            ['title' => '开服时间'],
            ['title' => '开服天数'],
            ['title' => '数据库Host'],
            ['title' => 'actor数据库名'],
            ['title' => ' log数据库名'],
            ['title' => '关服时间'],
            ['title' => '操作','width' => '100px;'],
        ];
        $ajaxSource = "admin.php?ctrl=server&act=dataTablesRespond";
        $js = <<< END
        function server_delete(server_id) {
            $.dialog.confirm('你确定要删除服务器' + server_id + ' 吗？', function(){
                $.ajax({
                    type: "POST",
                    url: "admin.php?ctrl=server&act=submit&type=del",
                    data: 'server_id='+server_id,
                    timeout: 20000,
                    error: function(){\$.dialog.alert('超时');},
                    success: function(result){
                      \$tabs.tabs( "load" , 0 );
                    }
                });
            }, function(){
                $.dialog.tips('取消操作');
            });
        }
        function server_edit(server_id){
           \$tabs.tabs( "url" , 1 , "admin.php?ctrl=server&act=edit&server_id="+server_id );
           \$tabs.tabs( "select" , 1 );
           \$tabs.tabs( "url" , 1 , "admin.php?ctrl=server&act=edit");
        }
END;
        $otherData = ['js' => $js];
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function dataTablesRespond() {
        $where = array();
        $_GET['sSearch_0'] && $where[] = "name LIKE '%{$_GET['sSearch_0']}%' ";
        $_GET['sSearch_1'] && $where[] = "channel = '{$_GET['sSearch_1']}' ";

        $orderF = array('server_id','name', 'channel');

        $conditon = array(
            'sEcho' => $_GET['sEcho'],
            'limit' => intval($_GET['iDisplayStart']) .",".intval($_GET['iDisplayLength']),
            'where' => implode(" AND ",$where),
            'order' => $orderF[$_GET['iSortCol_0']] ? $orderF[$_GET['iSortCol_0']]." ".$_GET['sSortDir_0'] : ''
        );
        echo $this->ServerModel->getData($conditon);
    }

    // --------------------------------------------------------------------

    /**
     * 编辑&添加服务器
     */
    public function edit(){
        $server_id = $this->getParam('server_id');
        $server_id && $server = $this->ServerModel->handle('getOne',array('where'=>"server_id={$server_id}"), 'server');

        !$server && $server = array(
                'mysql_host' => '127.0.0.1',
                'mysql_port' => '3306',
                'mysql_user' => 'root',
                "mysql_passwd" => "",
                'actor_table'=>'actor',
                'log_table'=>'log',
        );
        $this->smarty->assign('server', $server);
        $this->smarty->assign('serverStatus', CDict::$serverStatus);
        $this->smarty->assign('purview_database_setting',  has_purview('server', 'database_setting'));
        $this->smarty->assign('channel', (new StatModel())->handle('getList',array(), 'channel') );

        $this->smarty->display('server/edit.tpl');
    }

    // --------------------------------------------------------------------

    public function submit(){
        switch($_REQUEST['type']){
            case 'del':
                $server_id = $this->getParam('server_id');
                $data['where']="server_id={$server_id}";
                echo $this->ServerModel->handle('delete',$data,'server');
                (new LogModel())->logAdd("删除服务器，flag：$server_id");
                break;
            case 'edit':
                $id= $this->getParam('id');
                $server_id = trim($_POST['server_id']);
                if(empty($server_id))  exit("必须填写服务器ID");

                $data = array(
                    'name'          => trim($_POST['name']),
                    'status'        => trim($_POST['status']),
                    'game_version'  => trim($_POST['game_version']),
                    'open_time'     => trim($_POST['open_time']),
                    'close_time'    => trim($_POST['close_time']) ? trim($_POST['close_time']) : "0000-00-00 00:00:00",
                    'server_ip'     => trim($_POST['server_ip']),
                    'server_port'   => trim($_POST['server_port']),
                    'channel'       => trim($_POST['channel']),
                    'mysql_host'    => trim($_POST['mysql_host']),
                    'mysql_port'    => trim($_POST['mysql_port']),
                    'mysql_user'    => trim($_POST['mysql_user']),
                    'mysql_passwd'  => trim($_POST['mysql_passwd']),
                    'actor_table'   => trim($_POST['actor_table']),
                    'log_table'     => trim($_POST['log_table']),
                    'merge_id'      => trim($_POST['merge_id']),
                );

                if($id){
                    $condition = array( 'where'=>"id={$id}",'data'=>$data);
                    $ok = $this->ServerModel->handle('update', $condition, 'server');
                    $msg = '修改';
                }else{
                    $foo = array(
                        'where'  => "server_id={$server_id}",
                        'fields' =>'id',
                    );
                    if( $this->ServerModel->handle('getOne', $foo, 'server') ) exit("服务器ID不能重复，请换一个");

                    $data['server_id'] = $server_id;
                    $post_data['data']=$data;
                    $ok = $this->ServerModel->handle('insert',$post_data, 'server');
                    $msg = '添加';
                }

                if( !$ok ){
                    echo $msg."失败";
                } else{
                    echo 1;
                }

               (new LogModel())->logAdd("{$msg}服务器信息：{$data['name']}");
               break;
        }
    }

}
/* End of file ServerController.class.php */
/* Location: ./controller/ServerController.class.php  */

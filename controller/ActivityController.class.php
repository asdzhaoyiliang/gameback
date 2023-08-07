<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class ActivityController 活动管理
 *
 * @copyright       Copyright&copy;2015, ZJL
 * @author          ZJL <vccrazy@qq.com>
 * @version         1.0
 * @since           2015-09-01
 */
class ActivityController extends Controller{

    function __construct(){
        parent::__construct();
        $this->Model = new Model();
    }

    // --------------------------------------------------------------------

    public function index(){
		$tabs = array(
            array('title' => '活动列表',      'url' => 'admin.php?ctrl=activity&act=dataTablesRequest'),
            array('title' => '添加/编辑活动', 'url' => 'admin.php?ctrl=activity&act=add'),
		);
	    $this->themeTabs($tabs);
	}

    // --------------------------------------------------------------------

    public function dataTablesRequest(){
        $searchFields = array();
        $showFields = array(
            array('title' => '活动ID'),
            array('title' => '活动名称'),
            array('title' => '开始时间'),
            array('title' => '结束时间'),
            array('title' => '是否重置'),
            array('title' => '服务器'),
            array('title' => '同步'),
            array('title' => '操作'),
        );
        $ajaxSource = "admin.php?ctrl=activity&act=dataTablesRespond";
        $js = <<< END
        function edit(id) {
            \$tabs.tabs( "url" , 1 , "admin.php?ctrl=activity&act=add&id="+id);
            \$tabs.tabs( "select" , 1 );
            \$tabs.tabs( "url" , 1 , "admin.php?ctrl=activity&act=add");
        }

        function handle(id,t){
             $.dialog.confirm('确定要操作吗？', function(){
                $.ajax({
                    type: "POST",
                    url: "admin.php?ctrl=activity&act=submit",
                    data: 'type='+t+'&id='+id,
                    timeout: 20000,
                    error: function(){\$.dialog.alert('超时');},
                    success: function(result){
                        if(result == 'success'){
                            \$tabs.tabs( "load" , 0 );
                        }else{
                            \$.dialog.alert(result);
                        }
                    }
                });
            }, function(){
                $.dialog.tips('取消操作');
            });
        }
END;
        $otherData = array('js' => $js);
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function dataTablesRespond(){
        $condition = array('ServerIsNotNeed'=>TRUE,'timeIsNotNeed'=>TRUE);
        $condition = $this->_DataTablesCondition($_GET, array(), "*", $condition);

        $res = $this->Model->handle('getList', $condition, 'activity');
        if ($res) {
            foreach( $res as $row ){
                $option = '<a href="javascript:;" onclick="edit('.$row['id'].')">编辑</a>  | ' ;
                $option .= '<a href="javascript:;" onclick="handle('.$row['id'].',\'sync\')">同步</a>  | ' ;
                $option .= '<a href="javascript:;" onclick="handle('.$row['id'].',\'del\')">删除</a>';

                $aaData[] = array(
                    $row['id'],
                    $row['name'],
                    $row['stime'],
                    $row['etime'],
                    $row['repeat']==0?'否':'是',
                    $row['serverid'],
                    $row['sync']==0 ? '未同步' : '已同步',
                    $option
                );
            }
        }
        echo  $this->Model->returnJsonData($condition, $aaData ? $aaData : array());
    }

    // --------------------------------------------------------------------

    /**
     * 添加、编辑活动
     */
    public function add(){
       $info = $selected = array();
        if ($this->getParam('id')) {
            $info = $this->Model->handle('getOne', array('where' => "id=".$this->getParam('id')), 'activity');
            $selected = explode(',', $info['serverid']);
        }
        $this->smarty->assign('info', $info);
        $this->smarty->assign('server', $this->multiSelectServer($selected));
        $this->smarty->display('activity/add.tpl');
    }

    // --------------------------------------------------------------------

    public function submit(){
        $requestData = $_REQUEST;
        unset($requestData['ctrl'], $requestData['act'],$requestData['type']);

        switch($_REQUEST['type']){
            case 'add':
                if( ! $requestData['id'])       exit('请填写活动ID');
                if( ! $requestData['name'])     exit('请填写活动名称');
				if( ! $requestData['strcom'])     exit('请填写活动配置表');
                if( ! $requestData['serverid']){
                    exit('请选择服务器');
                }else{
                    $requestData['serverid'] = implode(",", $requestData['serverid']);
                }

                $requestData['stime'] && $requestData['stime'] = date("Y-m-d H:i:s", strtotime($requestData['stime'] ));
                $requestData['etime'] && $requestData['etime'] = date("Y-m-d H:i:s", strtotime($requestData['etime'] ));

                if( $requestData['etime'] && strtotime($requestData['etime']) <= time() )
                    exit("结束时间不能小于当前时间");

                if( $requestData['stime'] && $requestData['etime'] && $requestData['stime'] >= $requestData['etime'])
                    exit("结束时间不能小于等于开始时间");

                if( ! $this->Model->handle('replace', array('data' => $requestData), 'activity') )
                    exit("数据插入失败");

                exit('success');
                break;
            case 'del':
                $id = $requestData['id'];
                if ( ! $this->Model->handle('delete', array('where' => "id=$id"), 'activity') )
                    exit("操作失败，请稍后再试");

                exit('success');
                (new LogModel())->logAdd("删除活动：{$id}");
                break;

            case 'sync':
                $id = $requestData['id'];
                $info = $this->Model->handle('getOne', array('where' => "id=$id"), 'activity');
                $data = array(
                    'operindex'  =>  MSS_OPERATION_ACT,
                    'nstate'    => "1",
                    'username' => '',
                    'logdate' => date("Y-m-d"),
                    'reser1' => "1",
                    'strcom' => $info['strcom']
                );
                foreach( explode(',',$info['serverid']) as $serverid ){
                    $data['serverindex']=$serverid;
                    Util::sync('command', $serverid, $data);
                }
                $this->Model->handle('update', array('where' => "id=$id",'data' => array('sync' => 1), 'activity') );

                exit('success');
                (new LogModel())->logAdd("同步活动：{$id}");
                break;
        }
    }
}
/* End of file ActivityController.class.php */
/* Location: ./controller/ActivityController.class.php  */

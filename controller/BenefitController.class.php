<?php defined('IN_WEB') ||  exit('Access Denied');
/**
 * Class BenefitController
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */


class BenefitController extends Controller{

    function __construct(){
        parent::__construct();
        $this->BenefitModel = new BenefitModel();
    }

    // --------------------------------------------------------------------

    public function index(){
        $tabs = array(
            array('title' => '福利列表', 'url' => 'admin.php?ctrl=benefit&act=dataTablesRequest'),
            array('title' => '添加福利', 'url' => 'admin.php?ctrl=benefit&act=edit'),
        );
        $this->themeTabs($tabs);
    }

    // --------------------------------------------------------------------

    /**
     * 服务器列表
     */
    public function dataTablesRequest(){
        $searchFields = [
            ['title'=>'福利名称', 'type'=>'input'],
//            ['title'=>'渠道标识', 'type'=>'input'],
        ];
        $showFields = [
            ['title' => '福利ID','sortable'=>true,'width' => '65px;'],
            ['title' => '福利名称','sortable'=>true,'width' => '65px;'],
            ['title' => '备注','sortable'=>true,'width' => '150px;'],
            ['title' => '首次福利','sortable'=>true],
            ['title' => '固定福利'],
            ['title' => '福利周期类型'],
            ['title' => '福利周期'],
            ['title' => '发放时间点'],
            ['title' => '操作','width' => '100px;'],
        ];
        $ajaxSource = "admin.php?ctrl=benefit&act=dataTablesRespond";
        $js = <<< END
        function benefit_delete(benefit_id) {
            $.dialog.confirm('你确定要删除福利' + benefit_id + ' 吗？', function(){
                $.ajax({
                    type: "POST",
                    url: "admin.php?ctrl=benefit&act=submit&type=del",
                    data: 'benefit_id='+benefit_id,
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
        function benefit_edit(benefit_id){
           \$tabs.tabs( "url" , 1 , "admin.php?ctrl=benefit&act=edit&benefit_id="+benefit_id );
           \$tabs.tabs( "select" , 1 );
           \$tabs.tabs( "url" , 1 , "admin.php?ctrl=benefit&act=edit");
        }
END;
        $otherData = ['js' => $js];
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function dataTablesRespond() {
        $where = array();
        $_GET['sSearch_0'] && $where[] = "name LIKE '%{$_GET['sSearch_0']}%' ";
//        $_GET['sSearch_1'] && $where[] = "channel = '{$_GET['sSearch_1']}' ";

        $orderF = array('benefit_id');

        $conditon = array(
            'sEcho' => $_GET['sEcho'],
            'limit' => intval($_GET['iDisplayStart']) .",".intval($_GET['iDisplayLength']),
            'where' => implode(" AND ",$where),
            'order' => $orderF[$_GET['iSortCol_0']] ? $orderF[$_GET['iSortCol_0']]." ".$_GET['sSortDir_0'] : ''
        );
        echo $this->BenefitModel->getData($conditon);
    }

    // --------------------------------------------------------------------

    /**
     * 编辑&添加服务器
     */
    public function edit(){
        $benefit_id = $this->getParam('benefit_id');
        $benefit_id && $benefit = $this->BenefitModel->handle('getOne',array('where'=>"benefit_id={$benefit_id}"), 'benefit');

        $this->smarty->assign('benefit', $benefit);
        $this->smarty->assign('purview_database_setting',  has_purview('benefit', 'database_setting'));


        $this->smarty->display('benefit/edit.tpl');
    }

    // --------------------------------------------------------------------

    public function submit(){
        switch($_REQUEST['type']){
            case 'del':
                $benefit_id = $this->getParam('benefit_id');
                $data['where']="benefit_id={$benefit_id}";
                echo $this->BenefitModel->handle('delete',$data,'benefit');
                (new LogModel())->logAdd("删除服务器，flag：$benefit_id");
                break;
            case 'edit':
                $id= $this->getParam('benefit_id');
//                $benefit_id = trim($_POST['benefit_id']);
//                if(empty($benefit_id))  exit("必须填写服务器ID");

                $data = array(
                    'name'          => trim($_POST['name']),
                    'reason'     => trim($_POST['reason']),
                    'first_mail'   => trim($_POST['first_mail']),
                    'common_mail'       => trim($_POST['common_mail']),
                    'cycle'      => trim($_POST['cycle']),
                    'day'      => trim($_POST['day']),
                    'send_time'      => trim($_POST['send_time']),
                );

                if($id){
                    $condition = array( 'where'=>"benefit_id={$id}",'data'=>$data);
                    $ok = $this->BenefitModel->handle('update', $condition, 'benefit');
                    $msg = '修改';

                    //同步给服务器

                    $con = array(
                        'where'  => "benefit_id={$id}",
                        'fields' =>'name,role_guids',
                    );
                    $benefit = $this->BenefitModel->handle('getOne', $con, 'benefit');
                    $roleGuids = json_decode($benefit['role_guids'],true);
                    $servers = array();
                    foreach ($roleGuids as $server_id){
                        if (!in_array($server_id,$servers)) {
                            $ser = (new ServerModel())->getOneById($server_id);
                            Util::requestGameForBenefit($ser['server_ip'], $ser['server_port'], $ser['group_id'], $ser['server_id'],$id,$_POST['first_mail'],$_POST['common_mail'],$_POST['cycle'],$_POST['day'],$_POST['send_time']);
                            $servers[] = $server_id;
                        }
                    }

                }else{
                    $foo = array(
                        'where'  => "benefit_id={$id}",
                        'fields' =>'id',
                    );
                    if( $this->BenefitModel->handle('getOne', $foo, 'benefit') ) exit("福利ID不能重复，请换一个");

                    $data['benefit_id'] = $id;
                    $post_data['data']=$data;
                    $ok = $this->BenefitModel->handle('insert',$post_data, 'benefit');
                    $msg = '添加';
                }



                if( !$ok ){
                    echo $msg."失败";
                } else{
                    echo 1;
                }

               (new LogModel())->logAdd("{$msg}福利信息：{$data['name']}");
               break;
        }
    }

}
/* End of file BenefitController.class.php */
/* Location: ./controller/BenefitController.class.php  */

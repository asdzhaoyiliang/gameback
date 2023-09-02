<?php defined('IN_WEB') ||  exit('Access Denied');
/**
 * Class BenefitUserController
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */


class BenefitUserController extends Controller{

    function __construct(){
        parent::__construct();
        $this->BenefitUserModel = new BenefitUserModel();
    }

    // --------------------------------------------------------------------

    public function index(){
        $tabs = array(
            array('title' => '福利列表', 'url' => 'admin.php?ctrl=benefituser&act=dataTablesRequest'),
            array('title' => '添加福利', 'url' => 'admin.php?ctrl=benefituser&act=edit'),
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
            ['title' => '服务器ID','sortable'=>true,'width' => '65px;'],
            ['title' => 'uid','sortable'=>true,'width' => '65px;'],
            ['title' => '备注','sortable'=>true,'width' => '150px;'],
            ['title' => '福利ID','sortable'=>true],
            ['title' => '福利名称'],
            ['title' => '操作','width' => '100px;'],
        ];
        $ajaxSource = "admin.php?ctrl=benefituser&act=dataTablesRespond";
        $js = <<< END
        function benefituser_delete(id) {
            $.dialog.confirm('你确定要删除福利吗？', function(){
                $.ajax({
                    type: "POST",
                    url: "admin.php?ctrl=benefituser&act=submit&type=del",
                    data: 'id='+id,
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
END;
        $otherData = ['js' => $js];
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function dataTablesRespond() {
        $where = array();
        $_GET['sSearch_0'] && $where[] = "user_id LIKE '%{$_GET['sSearch_0']}%' ";
//        $_GET['sSearch_1'] && $where[] = "channel = '{$_GET['sSearch_1']}' ";

        $orderF = array('benefit_id');

        $conditon = array(
            'sEcho' => $_GET['sEcho'],
            'limit' => intval($_GET['iDisplayStart']) .",".intval($_GET['iDisplayLength']),
            'where' => implode(" AND ",$where),
            'order' => $orderF[$_GET['iSortCol_0']] ? $orderF[$_GET['iSortCol_0']]." ".$_GET['sSortDir_0'] : ''
        );
        echo $this->BenefitUserModel->getData($conditon);
    }

    // --------------------------------------------------------------------

    /**
     * 编辑&添加服务器
     */
    public function edit(){

        $this->smarty->display('benefit_user/edit.tpl');
    }

    // --------------------------------------------------------------------

    public function submit(){
        switch($_REQUEST['type']){
            case 'del':
                $id = $this->getParam('id');

                //获得福利信息
                $con = array(
                    'where'  => "id={$id}",
                    'fields' =>'*',
                );
                $benefit_user = $this->BenefitUserModel->handle('getOne', $con, 'benefit_user');
                $con2 = array(
                    'where'  => "benefit_id={$benefit_user['benefit_id']}",
                    'fields' =>'*',
                );
                $benefit = $this->BenefitUserModel->handle('getOne', $con2, 'benefit');

                $ser = (new ServerModel())->getOneById($benefit_user['server_id']);
                Util::requestGameForBenefit($ser['server_ip'], $ser['server_port'], $ser['group_id'], $ser['server_id'],$benefit['benefit_id'],$benefit['first_mail'],$benefit['common_mail'],$benefit['cycle'],$benefit['day'],$benefit['send_time'],$benefit_user['user_id'],2);

                $data['where']="id={$id}";
                echo $this->BenefitUserModel->handle('delete',$data,'benefit_user');

                break;
            case 'edit':
                $benefit_id= $this->getParam('benefit_id');
                $server_id = trim($_POST['server_id']);

                //获得福利信息
                $con = array(
                    'where'  => "benefit_id={$benefit_id}",
                    'fields' =>'*',
                );
                $benefit = $this->BenefitUserModel->handle('getOne', $con, 'benefit');
                $roleGuids = json_decode($benefit['role_guids'],true);

                //添加用户福利表
                $user= $this->getParam('users');
                $a = explode("|",$user);
                foreach ($a as $value){
                    $b = explode(":",$value);
                    $server_id = $b[0];
                    $user_id = $b[1];

                    $foo = array(
                        'where'  => "user_id={$user_id} and benefit_id = {$benefit_id}",
                        'fields' =>'*',
                    );
                    if( $this->BenefitUserModel->handle('getOne', $foo, 'benefit_user') )continue;

                    $data = array(
                        'user_id'          => trim($user_id),
                        'benefit_id'   => trim($benefit_id),
                        'benefit_name'   => trim($benefit['name']),
                        'server_id'     => trim($server_id),
                        'reason'     => trim($_POST['reason']),
                    );

                    $post_data['data']=$data;
                    $ok = $this->BenefitUserModel->handle('insert',$post_data, 'benefit_user');
                    $roleGuids[$user_id] = $server_id;

                    //发送请求给目标服务器,更新福利用户
                    $ser = (new ServerModel())->getOneById($server_id);

                    Util::requestGameForBenefit($ser['server_ip'], $ser['server_port'], $ser['group_id'], $ser['server_id'],$benefit_id,$benefit['first_mail'],$benefit['common_mail'],$benefit['cycle'],$benefit['day'],$benefit['send_time'],$user_id,1);

                }

                //更新福利表的用户
                $data = array(
                    'role_guids'          => json_encode($roleGuids),
                );
                $condition = array( 'where'=>"benefit_id={$benefit_id}",'data'=>$data);
                $ok = $this->BenefitUserModel->handle('update', $condition, 'benefit');

                echo 1;

               break;
        }
    }

}
/* End of file BenefitController.class.php */
/* Location: ./controller/BenefitController.class.php  */

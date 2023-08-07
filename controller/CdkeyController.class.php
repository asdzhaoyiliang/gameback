<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class CdkeyController 激活码
 *
 * @copyright       Copyright&copy;2015, ZJL
 * @author          ZJL <vccrazy@qq.com>
 * @version         1.0
 * @since           2015-09-01
 */
class CdkeyController extends Controller{

    function __construct(){
        parent::__construct();
        $this->LogModel = new LogModel();
        $this->cdkeyModel = new CdkeyModel();
    }

    // --------------------------------------------------------------------

    public function index(){
		$tabs = array(
           array('title'=>'生成激活码','url'=>'admin.php?ctrl=cdkey&act=showPage&type=add'),
           array('title'=>'查看激活码','url'=>'admin.php?ctrl=cdkey&act=dataTablesRequest_list'),
            array('title'=>'批管理','url'=>'admin.php?ctrl=cdkey&act=showPage&type=pi'),
           array('title'=>'使用记录','url'=>'admin.php?ctrl=cdkey&act=dataTablesRequest_use'),
           array('title'=>'导出激活码','url'=>'admin.php?ctrl=cdkey&act=showPage&type=export'),

		);
	    $this->themeTabs($tabs);
	}

    // --------------------------------------------------------------------

    //查看激活码
    public function dataTablesRequest_list(){
        $searchFields = [
            ['type'=>'input','title'=>'激活码'],
            ['type'=>'input','title'=>'批号'],
        ];
        $showFields = [
            ['title' => '激活码','width'=>'80'],
            ['title' => '批号','width'=>'40'],
            ['title' => '批名','width'=>'80'],
            ['title' => '道具ID','width'=>'60'],
            ['title' => '可使用次数','width'=>'80'],
            ['title' => '已使用次数','width'=>'80'],
            ['title' => '同批号使用限制','width'=>'100'],
            ['title' => '互斥组','width'=>'60'],
            ['title' => '服务器'],
            ['title' => '有效时间'],
            ['title' => '描述'],
        ];
        $ajaxSource = "admin.php?ctrl=cdkey&act=dataTablesRespond_list";
        $otherData = array();
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function dataTablesRespond_list(){
        $where = array();
        $_GET['sSearch_0'] && $where[] =  "cdkey = '{$_GET['sSearch_0']}'";
        $_GET['sSearch_1'] && $where[] =  "batch_id = {$_GET['sSearch_1']}";


        $sql = "SELECT ck.*,b.* FROM bg_cdkey AS ck LEFT JOIN bg_batch AS b ON ck.batch_id=b.id WHERE 1";
        $_GET['sSearch_0'] && $sql .=  " AND ck.cdkey = '{$_GET['sSearch_0']}'";
        $_GET['sSearch_1'] && $sql .=  " AND ck.batch_id = {$_GET['sSearch_1']}";
        $sql .= " LIMIT " . intval($_GET['iDisplayStart']) .",". intval($_GET['iDisplayLength']);

        $condition = array(
            'where' => implode(" AND ", $where),
            'sql'   => $sql,
            'sEcho' => $_GET['sEcho']
        );
        echo  $this->cdkeyModel->getData('find', $condition, 'cdkey');
    }

    // --------------------------------------------------------------------\

    //使用记录
    public function dataTablesRequest_use(){
        $searchFields = [
            ['type'=>'server','title'=>'服务器','value'=>$this->serverList()],
            ['type'=>'range_date','title'=>'使用日期'],
            ['type'=>'input','title'=>'激活码'],
            ['type'=>'input','title'=>'角色ID'],
            ['type'=>'input','title'=>'批号'],
        ];
        $showFields = [
            ['title' => '激活码','sortable'=>true],
            ['title' => '角色ID','sortable'=>true],
            ['title' => '服务器','sortable'=>true],
            ['title' => '批号','sortable'=>true],
            ['title' => '使用时间','sortable'=>true],
        ];
        $ajaxSource = "admin.php?ctrl=cdkey&act=dataTablesRespond_use";
        $otherData = [];
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function dataTablesRespond_use(){
        $orderF = array('cdkey','actorid','serverid','batch_num','create_time');

        $where = array();
        $_GET["sSearch_2"] &&  $where[] = "cdkey = '{$_GET["sSearch_2"]}'";
        $_GET["sSearch_3"] &&  $where[] = "actorid = {$_GET["sSearch_3"]}";
        $_GET["sSearch_4"] &&  $where[] = "batch_num = {$_GET["sSearch_4"]}";

        $otherCondition = array(
            'otherWhere' => implode(" AND ",$where),
        );
        $condition = $this-> _DataTablesCondition($_GET, $orderF, "*", $otherCondition);

        echo $this->cdkeyModel->getData('getList', $condition, 'cdkey_use');
    }

    // --------------------------------------------------------------------

    public function showPage(){
        switch($this->getParam('type')){
            case 'pi':
                $this->smarty->assign('server', $this->multiSelectServer());
                $this->smarty->assign('batch', $this->cdkeyModel->handle('getList', array(), 'batch'));
                $this->smarty->display('cdkey/pi.tpl');
                break;
            case 'export':
                $this->smarty->assign('batch', $this->cdkeyModel->handle('getList', array('fields'=>'id,name'), 'batch'));
                $this->smarty->assign('server',$this->multiSelectServer());
                $this->smarty->display('cdkey/export.tpl');
                break;
            case 'add':
                $this->smarty->assign('batch', $this->cdkeyModel->handle('getList', array('fields'=>'id,name'), 'batch'));
                $this->smarty->display('cdkey/add.tpl');
                break;
        }

    }

    // --------------------------------------------------------------------

    //生成激活码
    private function create_code($post) {
        $n = 8; //激活码位数
        $str = 'ABCDEFGHLJKMNOPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789';
        $len = strlen($str);

        $foo['batch_id'] = intval($post['batch_id']);

        $code = [];
        for ($a = 0; $a < $post['num']; $a++) {
            $key = '';
            for ($i = 0; $i < $n; $i++) {
                $xxx = mt_rand(0, $len - 1);
                $key .= $str[$xxx];//激活码
            }
            $foo['cdkey'] = $key;
            $code[] = $foo;
        }

        $insert_num = 0;
        if ($post['num'] <= 10000){
            $insert_num = $this->cdkeyModel->handle('insert', array('data'=>$code, 'bacth'=>TRUE), 'cdkey');
        }else{
            $x = floor($post['num'] / 10000);
            $reminder = $post['num'] % 10000;
            for ($j = 0; $j < $x; $j++) {
                $tmp = array_slice($code, $j * 10000, 10000);
                $insert_num += $this->cdkeyModel->handle('insert', array('data'=>$tmp,'bacth'=>true), 'cdkey');
            }
            if ($reminder) {
                $tmp = array_slice($code, $j * 10000);
                $insert_num += $this->cdkeyModel->handle('add', array('data'=>$tmp,'bacth'=>true),'cdkey');
            }
        }

        if ($insert_num == $post['num']){
            return 'success';
        }else{
            $post['num'] = $post['num'] - $insert_num;
            return $this->create_code($post);
        }

    }

    // --------------------------------------------------------------------

    public function submit(){
        switch($_REQUEST['type']){
            case 'pi_add':
                $post = $_POST;

                if( !$post['name'] )        exit("请填写批名");
                if( !$post['item_id'] )     exit("请填写道具id");
                if( !$post['limit_pi'] )    exit("请填写同批号使用限制");
                if( !$post['limit_times'] ) exit("请填写使用次数");
                if( !$post['serverid'] && !$post['allServer'])    exit("请选择服务器");
                if($post['stime'] && strtotime($post['stime'])<strtotime('today')) exit("开始时间不能小于今天");
                if($post['etime'] && strtotime($post['etime'])<strtotime('today')) exit("结束时间不能小于今天");
                if($post['stime'] && $post['etime'] && strtotime($post['stime'])>= strtotime($post['etime']))
                    exit('结束时间不能小于等于开始时间');

                $arr = explode("\n",$post['item_id']);
                $items = "";
                for($i = 0; $i < count($arr); $i++){
                    if($i == (count($arr) - 1)){
                        $items =  $items.$arr[$i];
                    }else{
                        $items = $items.$arr[$i].";";
                    }
                }
                
                $data = array(
                    'name'        => $post['name'],
                    'item_id'     => $items,
                    'limit_pi'    => $post['limit_pi'],
                    'limit_times' => $post['limit_times'],
                    'serverid'    => $post['allServer'] ? $post['allServer'] : implode(",", $post['serverid']),
                    'create_time' => time()
                );
                $post['stime'] && $data['stime'] = trim($post['stime']);
                $post['etime'] && $data['etime'] = trim($post['etime']);
                $post['des']   && $data['des']   = $post['des'];
                $post['mutex'] && $data['mutex'] = $post['mutex'];

                if( $this->cdkeyModel->handle('insert',array('data'=>$data), 'batch') ){
                    exit("success");
                }
                break;
            case 'checkPi':
                if( !$_POST['batch_num'] ) exit();
                $res = $this->cdkeyModel->handle('getOne',array('where'=>"batch_num={$_POST['batch_num']}"), 'batch_num');
                if($res) exit(json_encode($res));
                break;
            case 'del_pi':
                if ($this->cdkeyModel->handle('delete', array('where' => "id=".$_POST['id']), 'batch') ){
                    exit("success");
                }
                break;
            case 'del_card':
                if ($this->cdkeyModel->handle('delete', array('where' => "batch_id=".$_POST['id']), 'cdkey') ){
                    exit("success");
                }
                break;
            case 'cdkey_add':
                if( ! $_POST['batch_id'] ) exit("请选择批号");
                if( ! $_POST['num'] ) exit("请填写数量");
                if( $this->create_code($_POST) ) exit("success");
                break;
            case 'export':
                if( ! $_GET['batch_id'] ) exit("请选择批号");
	            $batchid = $_GET['batch_id'];

                $sql = "SELECT ck.*,b.* FROM bg_cdkey AS ck LEFT JOIN bg_batch AS b ON ck.batch_id=b.id";
                $sql .= " WHERE ck.batch_id={$batchid}";
                $foo = $this->cdkeyModel->handle('find',array('sql'=>$sql));
                $data[] = array('礼包码','名称','服务器');
                $cdkey_name = "礼包码";
                if($foo){
                    foreach($foo as $val){
                        $cdkey_name = $val['name'];
                        $data[] = array(
                            $val['cdkey'],
                            //$val['batch_id'],
                            $val['name'],
                            //$val['item_id'],
                            //$val['mutex'],
                            //$val['limit_pi'],
                            //$val['limit_times'],
                            //$val['stime']."~".$val['etime'],
                            999999999 == $val['serverid'] ? "全服" : $val['serverid'],
                            //$val['des'],
                        );
                    }
                }
                //$filename = "cdkey".date("YmdHis",time());
                //$filename = $cdkey_name.date("Ymd",time());
                $filename = $cdkey_name;
                fputexcel($filename, $data, $type = 'array');//Util::exportExcel($data,$filename);

                break;
        }

    }

}
/* End of file CdkeyController.class.php */
/* Location: ./controller/CdkeyController.class.php  */
<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class LogController
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class LogController extends Controller{

    function __construct(){
        parent::__construct();
        $this->LogModel = new LogModel();
    }

    // --------------------------------------------------------------------

     public function index(){
		$tabs = array(
			array('title'=>'日志列表','url'=>'admin.php?ctrl=log&act=dataTablesRequest'),
		);
		$this->themeTabs($tabs);
	}

    // --------------------------------------------------------------------

	/**
	 * 日志列表
	 */
	public function dataTablesRequest(){
	    $searchFields = array(
	            'created'  => array('title' => '查询时间', 'type' => 'range_date'),
	            'username' => array('title' => '管理员'),
	            'ip'       => array('title' => '访问ip'),
	    );
	    
	    $showFields = array(
                'han'      => array('title' => '详细','width' => '30px'),
	            'log_id'   => array('title' => 'ID', 'width' => '15px'),
	            'module'   => array('title' => '模块'),
	            'action'   => array('title' => '操作'),
	            'desc'     => array('title' => '描述', 'width' => '200px'),
	            'username' => array('title' => '管理员'),
	            'ip'       => array('title' => 'IP'),
	            'created'  => array('title' => '时间'),
	    );

	    $otherData = array('id' => 'log_view','bSort' => false );
	    $ajaxSource = "admin.php?ctrl=log&act=dataTablesRespond";
	    $dataTable = $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData, false);
		$this->smarty->assign('dataTable', $dataTable);
	    $this->smarty->display('log/log_list.tpl');
	}
	public function dataTablesRespond(){
        $where = array();
        $time_range = explode('|', trim($_GET['sSearch_0']));
        trim($time_range[0]) && $where[] = "created >= {$time_range[0]}";
        trim($time_range[1]) && $where[] = "created <= {$time_range[1]}";
        trim($_GET['sSearch_1']) &&   $where[] = "username = ' " . trim($_GET['sSearch_1']) . "'";
        trim($_GET['sSearch_2']) &&   $where[] = "ip = ' " . trim($_GET['sSearch_2']) . "'";

        $condition = array(
            'otherWhere'      => implode(" AND ", $where),
            'ServerIsNotNeed' => TRUE,
            'timeIsNotNeed'   => TRUE,
        );
        $conditions = $this->_DataTablesCondition($_GET, array(), "*", $condition);

        echo $this->LogModel->getData($conditions);
	}

    // --------------------------------------------------------------------

	/**
	 * 详细日志
	 */
	public function log_detail(){
	    $log_id = intval($_POST['log_id']);
	    $log = $this->LogModel->handle('getOne',array('where'=>"id=$log_id"), 'log');

	    $data = unserialize($log['data']);

	    echo "<table><tr><td>POST:<br/><pre>";
	    print_r($data['POST']);

	    echo "</pre></td><td>GET:<br/><pre>";
	    print_r($data['GET']);

	    echo "</pre></td></tr></table>";
	}
	
}
/* End of file LogController.class.php */
/* Location: ./controller/LogController.class.php  */
<?php defined('IN_WEB') ||  exit('Access Denied');


class IncreorderController extends Controller{

	function __construct(){
		parent::__construct();
		$this->Model = new Model();
	}

	function index(){
		$tabs = array(
				array('title' => '每日新增充值', 'url' => 'admin.php?ctrl=Increorder&act=data_list'),
				//array('title' => '新增充值玩家', 'url' => 'admin.php?ctrl=Increorder&act=incre_list'),
				//array('title' => 'LTV统计', 'url' => 'admin.php?ctrl=Increorder&act=ltv'),
		);
		$this->themeTabs($tabs);
	}
	
	public function data_list(){
		$searchFields = [
		['type'=>'server','title'=>'服务器','value'=>$this->serverList()],
		//['title' => '日期', 'type' => 'range_date'],
		];
		
		$showFields = [
		['title' => '日期','sortable'=>true],
		['title' => '新增注册充值人数','sortable'=>true],
		['title' => '新增注册充值金额','sortable'=>true],
		['title' => '新增注册ARPU','sortable'=>true],
		['title' => '新增注册付费率','sortable'=>true],
		];
		$ajaxSource = 'admin.php?ctrl=Increorder&act=dataTableRequest';
	
		$this->themeDatatables($searchFields, $showFields, $ajaxSource);
	}
	
	public function dataTableRequest(){	
		$condition = $this->_DataTablesCondition($_GET, array('logdate'));//var_dump($condition);echo $_GET['sSearch_0'];exit;
		$serverid = $_GET['sSearch_0'];

		$sql = "select o.account,a.createtime,o.create_time,o.cp_orderid,o.money from bg_actors as a left join bg_order as o on a.actorid = o.actorid where a.serverindex = $serverid and o.serverid = $serverid order by a.createtime desc";
		$res = $this->Model->find($sql);//var_dump($res);
		$data = array();
		foreach($res as $val){
			if(substr($val['createtime'],0,10) == substr($val['create_time'],0,10)){
				$data[substr($val['createtime'],0,10)][] = $val;
				$data[substr($val['createtime'],0,10)]['money'] += $val['money'];
			}
		}//var_dump($data);exit;
		//新增注册数据保存到session中
		$_SESSION['increData'] = $data;
		foreach($data as $k => $v){
			$temp = array();
			foreach($v as $value){
				$temp[$value['account']] = $value['account'];
			}//echo '<pre>';var_dump($temp);
			//当天注册人数
			$con = array(
					'where'  => "logdate = '{$k}' AND serverid = {$serverid} ",
					'fields' => 'new_reg_num AS num,total_reg_num'
					);
			$reg = $this->Model->handle('getOne', $con, 'integrated_data');			
			$aaData[]=array(
					$k,
					(count($temp)-1),
					$v['money'],
					(count($temp)-1) ? round($v['money']/ (count($temp)-1),2) : 0,
					(count($temp)-1) ? round((count($temp)-1)*100/ $reg['num'],2)."%" : 0,				
			);
		}
		
		$json_arr = array(
            'sEcho'                => $condition['sEcho'],
            'iTotalRecords'        => 1,
            "iTotalDisplayRecords" => 1,
            'aaData'               => $aaData ? $aaData : array()
        );
      	echo json_encode($json_arr);
		
// 		$sql = "select accountname,createtime,serverindex from bg_actors where serverindex = $serverid";
// 		$actors = $this->Model->find($sql);
// 		$sql2 = "select account,money,serverid from bg_order where serverid = $serverid";
// 		$orders = $this->Model->find($sql2);

	}
	
	public function incre_list(){
		$searchFields = [
		['type'=>'server','title'=>'服务器','value'=>$this->serverList()],
		];
	
		$showFields = [
		['title' => '日期','sortable'=>true],
		['title' => '充值人数','sortable'=>true],
		['title' => '充值次数','sortable'=>true],
		];
		$ajaxSource = 'admin.php?ctrl=order&act=charge_daily_data';
	
		$this->themeDatatables($searchFields, $showFields, $ajaxSource);
	}
}

<?php defined('IN_WEB') ||  exit('Access Denied');
/**
 * Class OrderController
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class OrderController extends Controller{

    function __construct(){
        parent::__construct();
        $this->Model = new Model();
        $this->OrderModel = new OrderModel();
    }

    function index(){
        $tabs = array(
            array('title' => '每日充值', 'url' => 'admin.php?ctrl=order&act=charge_daily'),
            array('title' => '充值排行', 'url' => 'admin.php?ctrl=order&act=charge_rank'),
            array('title' => '充值记录', 'url' => 'admin.php?ctrl=order&act=charge_list'),
        	array('title' => '新增充值', 'url' => 'admin.php?ctrl=Increorder&act=data_list'),
        	array('title' => '充值等级', 'url' => 'admin.php?ctrl=order&act=charge_level'),
        	array('title' => '单笔充值', 'url' => 'admin.php?ctrl=order&act=singleorder'),
            array('title' => '累充分布', 'url' => 'admin.php?ctrl=order&act=totalorder'),
            array('title' => '渠道统计', 'url' => 'admin.php?ctrl=order&act=totalchannelorder'),
        );
        $this->themeTabs($tabs);
    }

    /**
     * 每日充值
     */
    public function charge_daily(){
        $searchFields = [
            ['type'=>'server','title'=>'服务器','value'=>$this->serverList()],
            ['title' => '日期', 'type' => 'range_date'],
        ];
        $showFields = [
            ['title' => '日期','sortable'=>true],
            ['title' => '充值人数','sortable'=>true],
            ['title' => '充值次数','sortable'=>true],
            ['title' => '二次充值人数','sortable'=>true],
            ['title' => '充值金额','sortable'=>true],
            ['title' => 'arpu'],

            //['title' => '付费率'],
            //['title' => '注收比'],

            //['title' => '新玩家付费人数'],
            //['title' => '新玩家付费率'],
            ['title' => '首冲人数','sortable'=>true],
            ['title' => '首冲付费率','sortable'=>true],
            //['title' => '首冲次数','sortable'=>true],
            //['title' => '首冲金额','sortable'=>true],
            //['title' => '首冲arpu'],
        ];
        $ajaxSource = 'admin.php?ctrl=order&act=charge_daily_data';
       // $otherData['searchFooter'] = '<button class="gbutton" onclick="_export()">导出</button>';
        $otherData['js'] = <<< END
            function _export() {
                var cp = getCp()
                cp.server = $('.field_0 select').val()
                cp.stime = $('.field_2 input:first').val()
                cp.etime = $('.field_2 input:last').val()
                window.open('admin.php?ctrl=order&act=export&' + $.param(cp))
            }
END;
        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function charge_daily_data(){
        $orderF=array(
            0=>'logdate',
            1=>'num',
            2=>'times',
            3=>'money',
            5=>'f_num',
            6=>'f_times',
            7=>'f_money'
        );
        echo $this->OrderModel->getData($this->_DataTablesCondition($_GET,$orderF), 'order_stat');
    }

    /**
     * 充值排行
     */
    public function charge_rank(){
        $searchFields = array(
            ['type'=>'server','title'=>'服务器','value'=>$this->serverList()],
        );
        $showFields = [
            ['title' => '排名','sortable'=>true],
            ['title' => '账号'],
            ['title' => '充值金额','sortable'=>true],
            ['title' => '充值次数','sortable'=>true],
            ['title' => '最后充值时间'],
            ['title' => '服务器ID'],
        ];
        $ajaxSource = 'admin.php?ctrl=order&act=charge_rank_data';
        $otherData=array();
        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function charge_rank_data(){
        $orderF=array(
            0=>'rank',
            2=>'money',
            3=>'times',
        );
        $condition = array('timeIsNotNeed'=>true);
        echo $this->OrderModel->getData($this->_DataTablesCondition($_GET,$orderF,"*",$condition),"order_rank");
    }

    /**
     * 充值等级
     */
    public function charge_level(){
        $this->smarty->assign('server', $this->serverList());
        $this->smarty->display('order/level.tpl');
    }
    public function charge_level_data(){
        $serverid= $_GET['sSearch_0'];
        $this->validateServer($serverid);
        $where ="serverid = $serverid";

        $res = $this->OrderModel->handle('getOne',array('where'=>$where),'order_level');

        if($res){
            $data = json_decode($res['content'], true);

            //等级充值次数和充值元宝分布
            $arrData1 = $arrData2 = array();
            foreach($data as $row){
                $arrData1[] = array($row['level'], $row['times']);
                $arrData2[] = array($row['level'], $row['money']);
            }
            $times_chart = Util::init_highchart("flash1",$arrData1,"等级充值次数分布","充值等级","充值次数",5);
            $gold_chart = Util::init_highchart("flash2",$arrData2,"等级充值元宝分布","充值等级","充值元宝",5);

            $this->smarty->assign("times_chart", $times_chart);
            $this->smarty->assign("gold_chart", $gold_chart);
            $this->smarty->assign("data", $data);
        }

        $this->smarty->display('order/level_content.tpl');
    }

    /**
     * 充值记录
     */
    public function charge_list(){
        $tabs = [
            ['title' => '成功订单列表', 'url' => 'admin.php?&ctrl=order&act=charge_order&type=order'],
            ['title' => '失败订单列表', 'url' => 'admin.php?&ctrl=order&act=charge_order&type=order_fail'],
        ];
        $this->themeTabs($tabs,'tabs_cl');
    }
    public function charge_order(){
        $searchFields = [
            ['type' => 'server', 'title' =>$this->serverList() ],
            ['title' => '渠道', 'type' => 'input'],
            ['title' => '账号', 'type' => 'input'],
            ['title' => '角色ID', 'type' => 'input'],
            ['title' => '内部订单号', 'type' => 'input'],
            ['title' => '渠道订单号', 'type' => 'input'],
        ];
        $showFileds = [
            ['title' => '充值时间', 'sortable' => true],
            ['title' => '充值金额', 'width'=>'80px'],
            ['title' => '账号'],
            //['title' => '创角时间'],
            ['title' => '角色ID', 'width'=>'80px'],
            ['title' => '角色等级', 'width'=>'80px'],
            ['title' => '服务器ID', 'width'=>'60px'],
            ['title' => '内部订单号'],
            ['title' => '渠道订单号'],
        ];

        $type = $this->getParam('type');
        if( 'order_fail' == $type) $showFileds[] = ['title' => '错误信息'];

        $ajaxSource = 'admin.php?&ctrl=order&act=chargeList&type='.$type;
        $otherData[] = array();
        $this->themeDatatables($searchFields, $showFileds, $ajaxSource, $otherData);
    }
    public function chargeList(){
        $orderByFields=array('create_time');

        if ( 999999999 != $_GET['sSearch_0'])   $where[] = "serverid = " . $_GET['sSearch_0'];
        if( $_GET['sSearch_1'] )  $where[] = "channel = '" . $_GET['sSearch_1'] ."'";
        if( $_GET['sSearch_2'] )  $where[] = "account = '" . $_GET['sSearch_2'] ."'";
        if( $_GET['sSearch_3'] )  $where[] = "actorid = " . $_GET['sSearch_3'];
        if( $_GET['sSearch_4'] )  $where[] = "cp_orderid = '" . $_GET['sSearch_4'] . "'";
        if( $_GET['sSearch_5'] )  $where[] = "orderid = '" . $_GET['sSearch_5'] . "'";

        $condition['where'] = $where ? implode( " AND ", $where) : '';
        $condition['order'] = $orderByFields[$_GET['iSortCol_0']] ? $orderByFields[$_GET['iSortCol_0']]." ".$_GET['sSortDir_0'] : '';
        $condition['limit'] = intval($_GET['iDisplayStart']).",".intval($_GET['iDisplayLength']);
        $condition['sEcho'] = $_GET['sEcho'];
        $condition['fields'] = '*';

        echo $this->OrderModel->getData($condition, $this->getParam('type'));
    }
    
   /*
    function ordercounter(){
        $tabs = array(
            array('title' => '单笔充值等级', 'url' => 'admin.php?ctrl=order&act=singleorder'),
            array('title' => '累计充值等级', 'url' => 'admin.php?ctrl=order&act=totalorder'),
        );
        $this->themeTabs($tabs);
    }
*/
    /**
     * 每日充值
     */
    public function singleorder(){
        $searchFields = [
            ['type'=>'server','title'=>'服务器','value'=>$this->serverList()],
            ['title' => '日期', 'type' => 'date'],
        ];
        $showFields = [
        	['title' => '日期'], 
            ['title' => '6元档(次)'],
            ['title' => '30元档(次)'],
            ['title' => '68元档(次)'],
            ['title' => '128元档(次)'],
            ['title' => '328元档(次)'],
            ['title' => '648元档(次)'],
    		];
        
        $ajaxSource = 'admin.php?ctrl=order&act=singleData';
        $this->themeDatatables($searchFields, $showFields, $ajaxSource);
    }
        
      public function singleData(){//var_dump($_GET);exit;
      	$serverid = $_GET['sSearch_0'];
      	$date = $_GET['sSearch_1'];
      	
      	$where = "where serverid = {$serverid} ";
      	$date && $where.=" and create_time like '%{$date}%'";
      	$sql = "select id,account,money,create_time,serverid from bg_order {$where}";
      	$res = $this->Model->find($sql);
      	//echo '<pre>';var_dump($res);exit;
      	$data = array();
      	foreach($res as $val){
      		//$data[substr($val['create_time'],0,10)][] = $val;
      		$data[substr($val['create_time'],0,10)][$val['money']] ++;
      	}
     	$aaData = array();
     	foreach($data as $k => $v){
     		$aaData[] = array(
     			$k,
     			$v['6.00'] ? $v['6.00'] :0,
     			$v['30.00']? $v['30.00'] :0,
     			$v['68.00']? $v['68.00'] :0,
     			$v['128.00']? $v['128.00'] :0,
     			$v['328.00']? $v['328.00'] :0,
     			$v['648.00']? $v['648.00'] :0,
     		);
     	}
     	
     	$json_arr = array(
     			'sEcho'                => $_GET['sEcho'],
     			'iTotalRecords'        => 1,
     			"iTotalDisplayRecords" => 1,
     			'aaData'               => $aaData ? $aaData : array()
     	);
     	echo json_encode($json_arr);
      }

    public function totalorder(){
    	$searchFields = [
    	['type'=>'server','title'=>'服务器','value'=>$this->serverList()],
    	['title' => '日期', 'type' => 'range_date'],
    	];
    	$showFields = [
    	['title' => '时间段','width' => 180],
    	['title' => '10元以下(人)'],
    	['title' => '11~50元(人)'],
    	['title' => '51~100元(人)'],
    	['title' => '101~500元(人)'],
    	['title' => '501~2000元(人)'],
    	['title' => '2000元以上(人)'],
    	];
    	
    	$ajaxSource = 'admin.php?ctrl=order&act=totalData';
    	$this->themeDatatables($searchFields, $showFields, $ajaxSource);   
    }
     public function totalData(){
        $serverid = $_GET['sSearch_0'];
        $date = $_GET['sSearch_1'];

        $time = explode("|",$date);
        $sDate = $time[0] ? $time[0] : date('Y-m-d');
        $eDate = $time[1] ? $time[1] : date('Y-m-d');
        $_time = $sDate . '/' . $eDate;
        $stime = strtotime($sDate);
        $etime = ($time[1]) ? (strtotime($eDate)+86400) : time();
        
        $ordermoney = array(
                'd01' => 'ordermoney <= 10',
                'd02' => 'ordermoney > 10 and ordermoney <= 50',
                'd03' => 'ordermoney > 50 and ordermoney <= 100',
                'd04' => 'ordermoney > 100 and ordermoney <= 500',
                'd05' => 'ordermoney > 500 and ordermoney <= 2000',
                'd06' => 'ordermoney > 2000'
        );
        $res = array();
        foreach($ordermoney as $k => $m){
            $sql = "select account,sum(money) as ordermoney from bg_order where serverid = {$serverid} and unix_timestamp(create_time) > {$stime} and unix_timestamp(create_time) < {$etime} group by account having {$m} ";
            $res[$k] = $this->Model->find($sql);
        }
        //var_dump($res);
        
            $aaData[0] = array(
                $_time,
                count($res['d01']) ? count($res['d01']) :0,
                count($res['d02']) ? count($res['d02']) :0,
                count($res['d03']) ? count($res['d03']) :0,
                count($res['d04']) ? count($res['d04']) :0,
                count($res['d05']) ? count($res['d05']) :0,
                count($res['d06']) ? count($res['d06']) :0
            );
   
        $json_arr = array(
                'sEcho'                => $_GET['sEcho'],
                'iTotalRecords'        => 1,
                "iTotalDisplayRecords" => 1,
                'aaData'               => $aaData ? $aaData : array()
        );
        echo json_encode($json_arr);
        
        
        /*
        $where = "where serverid = {$serverid} ";
        $date && $where.=" and create_time like '%{$date}%'";
        $sql = "select id,account,money,create_time,serverid from bg_order {$where}";
        $res = $this->Model->find($sql);
        
        $dateTime = array();
        foreach($res as $val){
            $dateTime[substr($val['create_time'],0,10)] = strtotime(substr($val['create_time'],0,10)) + 86400;
        }
        
        $data = array();
        $ordermoney = array(
                'd01' => 'ordermoney <= 10',
                'd02' => 'ordermoney > 10 and ordermoney <= 50',
                'd03' => 'ordermoney > 50 and ordermoney <= 100',
                'd04' => 'ordermoney > 100 and ordermoney <= 500',
                'd05' => 'ordermoney > 500 and ordermoney <= 2000',
                'd06' => 'ordermoney > 2000'
        );
        foreach($dateTime as $k => $time){
            foreach($ordermoney as $k1 => $m){
                $sql = "select account,sum(money) as ordermoney ,count(1) from bg_order where serverid = {$serverid} and unix_timestamp(create_time) < {$time} group by account,actorid having {$m}";
                $data[$k][$k1] = $this->Model->find($sql);
            }
        }//var_dump($data);
        foreach($data as $k => $v){
            $aaData[] = array(
                    $k,
                    count($v['d01']) ? count($v['d01']) :0,
                    count($v['d02']) ? count($v['d02']) :0,
                    count($v['d03']) ? count($v['d03']) :0,
                    count($v['d04']) ? count($v['d04']) :0,
                    count($v['d05']) ? count($v['d05']) :0,
                    count($v['d06']) ? count($v['d06']) :0
            );
        }
        
        $json_arr = array(
                'sEcho'                => $_GET['sEcho'],
                'iTotalRecords'        => 1,
                "iTotalDisplayRecords" => 1,
                'aaData'               => $aaData ? $aaData : array()
        );
        echo json_encode($json_arr);
        //var_dump($data);exit;
        
         */
    }
    public function totalchannelorder(){
        $searchFields = [
        ['title' => '日期', 'type' => 'range_date'],
        ];
        $showFields = [
        ['title' => '时间段','width' => 180],
        ['title' => '渠道'],
        ['title' => '总额'],
        ];
        
        $ajaxSource = 'admin.php?ctrl=order&act=totalchannelData';
        $this->themeDatatables($searchFields, $showFields, $ajaxSource);   
    }


    public function totalchannelData(){
    	$date = $_GET['sSearch_0'];

    	$time = explode("|",$date);
    	$sDate = $time[0] ? $time[0] : date('Y-m-d');
    	$eDate = $time[1] ? $time[1] : date('Y-m-d');
    	$_time = $sDate . '/' . $eDate;
    	$stime = strtotime($sDate);
    	$etime = ($time[1]) ? (strtotime($eDate)+86400) : time();

    	$res = array();
            $sql = "select  channel,sum(money) as ordermoney from bg_order where  unix_timestamp(create_time) > {$stime} and unix_timestamp(create_time) < {$etime} group by channel ";
            
            $res = $this->Model->find($sql);
            foreach($res as $val){
                $aaData[]=array(
                    $_time,
                    $val['channel'],
                    $val['ordermoney'],
                );
            }
    	$json_arr = array(
    			'sEcho'                => $_GET['sEcho'],
    			'iTotalRecords'        => 1,
    			"iTotalDisplayRecords" => 1,
    			'aaData'               => $aaData ? $aaData : array()
    	);
    	echo json_encode($json_arr);
    }
}
/* End of file OrderController.class.php */
/* Location: ./controller/OrderController.class.php  */
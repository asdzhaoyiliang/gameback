<?php defined('IN_WEB') ||  exit('Access Denied');
/**
 * Class StatController
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class StatController extends Controller{

	function __construct(){
		parent::__construct();
		$this->statModel = new StatModel();
	}

    // --------------------------------------------------------------------

    /**
     * 注册数据
     */
    public function reg(){
        $searchFields = [
            ['title'=>'服务器', 'type' => 'server', 'value'=>$this->serverList()],
            ['title' => '日期', 'type' => 'date'],
        ];
        $showFields = [
            ['title' => '日期',   'sortable' => true],
            ['title' => '注册数', 'sortable' => true],
        ];
        $ajaxSource = 'admin.php?ctrl=stat&act=dataTablesRespond&case=stat_reg';
        $otherData=array();

        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }

    // --------------------------------------------------------------------

    /**
     * 登录统计
     */
    public function login(){
        $searchFields = [
            ['title'=>'服务器', 'type' => 'server', 'value'=>$this->serverList()],
            ['title' => '日期', 'type' => 'date'],
        ];
        $showFields = [
            ['title' => '日期',    'sortable' => true],
            ['title' => '登录人数', 'sortable' => true],
        ];
        $ajaxSource = 'admin.php?ctrl=stat&act=dataTablesRespond&case=stat_login';
        $otherData=array();

        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }

    // --------------------------------------------------------------------

    /**
     * 等级统计
     */
    public function level(){
        $searchFields = [
            ['title'=>'服务器', 'type' => 'server', 'value'=>$this->serverList()],
            ['title' => '日期', 'type' => 'date'],
        ];
        $showFields = [
            ['title' => '日期'],
            ['title' => '等级', 'sortable' => true],
            ['title' => '数量', 'sortable' => true],
            ['title' => '比例'],
        ];
        $ajaxSource = "admin.php?ctrl=stat&act=dataTablesRespond&case=stat_level";
        $otherData = array();

        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }

    // --------------------------------------------------------------------

    /**
     * 产出与消耗
     */
    public function depletion(){
        $tab = array(
            array('title'=>'元宝','url'=>'admin.php?ctrl=stat&act=depletionItem&type=yb'),
            array('title'=>'铜钱','url'=>'admin.php?ctrl=stat&act=depletionItem&type=xb'),
            array('title'=>'银两','url'=>'admin.php?ctrl=stat&act=depletionItem&type=yl'),
            array('title'=>'绑定元宝','url'=>'admin.php?ctrl=stat&act=depletionItem&type=by'),
        );
        $this->themeTabs($tab);
    }
    public function depletionItem(){
        $searchFields = [
            ['title'=>'服务器', 'type' => 'server', 'value'=>$this->serverList()],
            ['title' => '日期', 'type' => 'range_date'],
        ];
        $showFields = [
            ['title' => '日期','sortable'=>true],
            ['title' => '消耗数量','sortable'=>true],
            ['title' => '参与消耗人数','sortable'=>true],
            ['title' => '人均消耗'],
            ['title' => '产生数量','sortable'=>true],
            ['title' => '参与产生人数','sortable'=>true],
            ['title' => '人均产生'],
        ];
        $ajaxSource = 'admin.php?ctrl=stat&act=dataTablesRespond&case=economy_all&type='.$this->getParam('type');
        $otherData=array();

        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }

    // --------------------------------------------------------------------

    /**
     * 消费排行榜
     */
    public function consumptionRank(){
        $tabs = array(
            array('title'=>'元宝消费排行榜','url'=>'admin.php?ctrl=stat&act=consumptionRankItem&t=1'),
            array('title'=>'商城消费排行榜','url'=>'admin.php?ctrl=stat&act=consumptionRankItem&t=2'),
            array('title'=>'物品消耗排行榜','url'=>'admin.php?ctrl=stat&act=consumptionRankItem&t=3'),
        );
        $this->themeTabs($tabs);
    }
    public function consumptionRankItem(){
        $t = $this->getParam('t');
        $searchFields = [
            ['title'=>'服务器', 'type' => 'server', 'value'=>$this->serverList()],
            ['title' => '日期', 'type' => 'date'],
        ];

        if($t == 1){
            $showFields = [
                ['title' => '日期'],
                ['title' => '排名'],
                ['title' => '消费点'],
                ['title' => '消费ID'],
                ['title' => '消耗元宝'],
                ['title' => '占比'],
            ];
        }else{
            $showFields = [
                ['title' => '日期'],
                ['title' => '排名'],
                ['title' => '消费物品'],
                ['title' => '消费物品ID'],
                ['title' => '消耗元宝'],
                ['title' => '占比'],
            ];
        }

        $ajaxSource = 'admin.php?ctrl=stat&act=consumptionRankAjaxData&case=rank&t='.$t;
        $otherData = array();

        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function consumptionRankAjaxData(){
        $logdate = $_GET["sSearch_1"] ? $_GET["sSearch_1"] : date('Y-m-d');
        $where[] = "a.logdate = '". $logdate . "'" ;
        $where[] = "a.serverid =" . $_GET["sSearch_0"];
        $where[] = "a.type = " . $this->getParam('t');
        $where = implode(" AND ", $where);
        $limit = intval($_GET['iDisplayStart']).",".intval($_GET['iDisplayLength']);

        $data = array(
            'where' => "logdate = '{$logdate}' AND serverid = {$_GET['sSearch_0']} AND type = " . $this->getParam('t'),
            'sEcho' => $_GET['sEcho']
        );

        echo $this->statModel->getData($data, 'rank', 'rank');
    }

    // --------------------------------------------------------------------

    /**
     *综合数据
     */
    public function integrated() {
        $searchFields = [
            ['title'=>'服务器', 'type' => 'server', 'value'=>$this->serverList()],
            ['title' => '日期', 'type' => 'range_date'],
        ];
        $showFields = [
            ['title' => '日期','sortable'=>true],
            ['title' => '总注册数'],
            ['title' => '当天注册数'],
            ['title' => '总创角数'],
            ['title' => '当天创角数'],
            ['title' => '登录人数'],
        ];
        $ajaxSource = 'admin.php?ctrl=stat&act=dataTablesRespond&case=integrated_data';
        $otherData = array();
        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);

    }

    // --------------------------------------------------------------------

    /**
     * 在线时长
     */
    public function onlineTime(){
        $searchFields = [
            ['title'=>'服务器', 'type' => 'server', 'value'=>$this->serverList()],
            ['title' => '日期', 'type' => 'date'],
        ];
        $showFields = [
            ['title' => '日期'],
            ['title' => '角色ID'],
            ['title' => '在线时长(时：分：秒)'],
            ['title' => '登录次数(次)'],
        ];
        $ajaxSource = 'admin.php?ctrl=stat&act=dataTablesRespond&case=online_time';
        $otherData = array();
        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }

    // --------------------------------------------------------------------

    /**
     *7日留存
     */
    public function keep(){
        $searchFields = [
            ['title'=>'服务器', 'type' => 'server', 'value'=>$this->serverList()],
            ['title' => '日期', 'type' => 'range_date'],
        ];
        $showFields = [
            ['title' => '日期','sortable'=>true,'width'=>'80px'],
            ['title' => 'D1留存(比率【数量】)'],
            ['title' => 'D2留存(比率【数量】)'],
            ['title' => 'D3留存(比率【数量】)'],
            ['title' => 'D4留存(比率【数量】)'],
            ['title' => 'D5留存(比率【数量】)'],
            ['title' => 'D6留存(比率【数量】)'],
            ['title' => 'D7留存(比率【数量】)'],
            ['title' => '注册数'],
        ];
        $ajaxSource = 'admin.php?ctrl=stat&act=dataTablesRespond&case=keep';
        $otherData = array();
        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }

    // --------------------------------------------------------------------

    /**
     * 手机数据
     */
    public function phone(){
        $tabs = array(
            array('title'=>'统计数据','url'=>'admin.php?ctrl=stat&act=phoneStat'),
            array('title'=>'使用信息','url'=>'admin.php?ctrl=stat&act=phoneInfo'),
        );
        $this->themeTabs($tabs);
    }
    public function phoneStat(){
        $searchFields = [
            ['title'=>'服务器', 'type' => 'server', 'value'=>$this->serverList()],
            ['title' => '日期', 'type' => 'date'],
        ];
        $showFields = [
            ['title' => '日期', 'width'=>'80px'],
            ['title' => '品牌', 'width'=>'60px'],
            ['title' => '数量(台)', 'width'=>'60px'],
            ['title' => '更多信息(型号：台数)'],
        ];
        $ajaxSource = 'admin.php?ctrl=stat&act=dataTablesRespond&case=phone_stat';
        $otherData = array();
        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function phoneInfo(){
        $searchFields = [
            ['title'=>'服务器', 'type' => 'server', 'value'=>$this->serverList()],
            ['title' => '日期', 'type' => 'date'],
            ['title' => '角色ID', 'type' => 'input'],

        ];
        $showFields = [
            ['title' => '日期','sortable'=>true],
            ['title' => '角色ID'],
            ['title' => '角色等级'],
            ['title' => '手机品牌'],
            ['title' => '手机型号'],
            ['title' => '手机版本'],
            ['title' => '分辨率'],
            ['title' => '网络商'],
            ['title' => '网络类型'],
            ['title' => '用户登录时间'],
        ];
        $ajaxSource = 'admin.php?ctrl=stat&act=dataTablesRespond&case=phone';
        $otherData = array();
        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }

    // --------------------------------------------------------------------
	public function AddMsg($str){
		file_put_contents("./debug.txt", "[". date("Y-m-d H:i:s") . "]". $str ."\r\n" ,  FILE_APPEND );
	}
	
	
    public function dataTablesRespond(){
        $tableName = $case = $this->getParam('case');
        switch($case){
            case 'stat_reg':
            case 'stat_login':
            case 'stat_level':
            case 'phone_stat':
                $condition['timeIsToday'] = true;
                $data = $this->_DataTablesCondition($_GET, array(), "*", $condition);
                break;
            case 'economy_all':
                $type = $this->getParam('type');
                $orderBy = array('logdate','amount','num','','amount','num');
                $condition['otherWhere'] = "currency='{$type}'";

                $data = $this->_DataTablesCondition($_GET, $orderBy, "*", $condition);
                break;
            case 'integrated_data':
                $orderBy = array('logdate');
                $data = $this->_DataTablesCondition($_GET, $orderBy);
                break;
            case 'online_time':
                $fields = "logdate,serverid,content";
                $condition['timeIsToday'] = TRUE;
                $data = $this->_DataTablesCondition($_GET, array(), $fields, $condition);
                break;
            case 'keep':
                $orderBy = array('logdate');
                $data = $this->_DataTablesCondition($_GET, $orderBy);
                break;
            case 'phone':
                $condition['timeIsToday'] = true;
                $_GET['sSearch_2'] && $condition['otherWhere'] = "actorid={$_GET['sSearch_2']}";
                $data = $this->_DataTablesCondition($_GET, array(), "*", $condition);
                break;
        }
		$this->AddMsg($this->statModel->getData($data, $tableName, $case));
        echo $this->statModel->getData($data, $tableName, $case);
    }

}
/* End of file StatController.php */
/* Location: ./controller/StatController.php  */
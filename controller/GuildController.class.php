<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class GuildController
 * 帮会信息
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class GuildController extends Controller{
    function __construct(){
        parent::__construct();
        $this->LogModel = new LogModel();
    }

    public function index(){
		$tabs = array(
            array('title'=>'帮会信息查询', 'url'=>'admin.php?ctrl=guild&act=dataTablesRequest'),
		);
	    $this->themeTabs($tabs);
	}

    public function dataTablesRequest(){
        $searchFields = [
            ['title'=>'服务器','type'=>'server', 'value'=>$this->serverList()],
            ['title' => '帮派名字', 'type' => 'input'],
            ['title' => '帮派ID', 'type' => 'input'],
        ];

        $showFields = array(
            'a'  => array('title' => '帮派ID','sortable'=>true,'width'=>'40px'),
            'b'  => array('title' => '帮派名字','sortable'=>true,'width'=>'80px'),
            'c'  => array('title' => '帮派等级'),
            'e'  => array('title' => '灵石数量'),
            'f'  => array('title' => '阵营类型'),
            'g'  => array('title' => '公告','width'=>'180px'),
            'h'  => array('title' => '状态','width'=>'40px'),
            'i'  => array('title' => '创建时间'),
            'j'  => array('title' => '积分','width'=>'40px'),
            'k'  => array('title' => '仙宗建筑等级'),
        );

        $ajaxSource = "admin.php?ctrl=guild&act=dataTablesRespond";

        $otherData[]=array();
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData, true);
    }

    public function dataTablesRespond(){
        $serverid = $_GET['sSearch_0'];
        $this->validateServer($serverid);

        $_GET['sSearch_1'] && $where[] = "guildname = '" . $_GET['sSearch_1'] . "'";
        $_GET['sSearch_2'] && $where[] = "guildid = " . $_GET['sSearch_2'];
        $where = $where ? implode(' AND ', $where) : '';

        $orderByFields = array('guildid', 'guildname');
        $order = $orderByFields[$_GET['iSortCol_0']] ? $orderByFields[$_GET['iSortCol_0']]." ".$_GET['sSortDir_0'] : '';
        $limit = intval($_GET['iDisplayStart']).",".intval($_GET['iDisplayLength']);
        $fields = 'guildid, guildname, level, stone, camp, memo, status, createtime, score, level2';

        $json_arr = array('aaData'=>array(),'iTotalRecords'=>0,'iTotalDisplayRecords'=>0);

        $res = Util::get_single_data_byMysql('actor', 'guildlist', $serverid, $fields, $where, 'dataTable', $order, $limit);

        $res && $json_arr = $res;

        $json_arr['sEcho']  = intval($_GET['sEcho']);

        echo json_encode($json_arr);
    }
}

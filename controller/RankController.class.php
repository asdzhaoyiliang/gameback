<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class RankController
 * 排行榜
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class RankController extends Controller{

    function __construct(){
        parent::__construct();
        $this->Model = new Model();
    }

    // --------------------------------------------------------------------

    public function index(){
        $tabs = array(
            array('title'=>'元宝消费排行榜','url'=>'admin.php?ctrl=rank&act=dataTablesRequest&t=1'),
            array('title'=>'商城消费排行榜','url'=>'admin.php?ctrl=rank&act=dataTablesRequest&t=2'),
            array('title'=>'物品消耗排行榜','url'=>'admin.php?ctrl=rank&act=dataTablesRequest&t=3'),
        );
        $this->themeTabs($tabs);
    }

    // --------------------------------------------------------------------

    public function dataTablesRequest(){
        $t = $this->getParam('t');
        $searchFields = [
            ['type'=>'server','title'=>'服务器','value'=>$this->serverList()],
            [ 'type' => 'range_date','title' => '日期'],
        ];

        if($t == 1){
            $showFields = [
                ['title' => '日期','sortable'=>true],
                ['title' => '排名','sortable'=>true],
                ['title' => '消费点','sortable'=>true],
                ['title' => '消费ID'],
                ['title' => '消耗元宝','sortable'=>true],
                ['title' => '占比'],
            ];
        }else{
            $showFields = [
                ['title' => '日期','sortable'=>true],
                ['title' => '排名','sortable'=>true],
                ['title' => '消费物品'],
                ['title' => '消费物品ID','sortable'=>true],
                ['title' => '消耗元宝','sortable'=>true],
                ['title' => '占比'],
            ];
        }

        $ajaxSource = 'admin.php?ctrl=rank&act=dataTablesRespond&t='.$t;
        $js = <<<END
END;

        $otherData = array('js'=>$js);
        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function dataTablesRespond(){
        if($this->getParam('t') == 1){
            $orderF = array(1=>'logdate', 2=>'rank', 3=>'phylum', 4=>'amount');
        }else{
            $orderF = array(1=>'logdate', 2=>'rank', 4=>'classfield', 5=>'amount');
        }

        $condition = $this->_DataTablesCondition($_GET, $orderF, "*", array( 'otherWhere' => "type=".$this->getParam('t')));

        $res =  $this->Model->handle('getList', $condition, 'rank');
        $aaData= array();
        if($res) {
            foreach($res as $val){
                $aaData[]=array(
                    '<a style="text-decoration: underline; cursor:pointer" onclick=showdetail('. $val['serverid'] .',\''. $val['logdate'] . '\')>' . $val['logdate'] . '</a>',
                    $val['rank'],
                    $val['phylum'],
                    $val['classfield'],
                    $val['amount'],
                    $val['radio'],

                );
            }
        }
        echo  $this->Model->returnJsonData($condition, $aaData?$aaData:array());
    }

}
/* End of file RankController.php */
/* Location: ./controller/RankController.php  */